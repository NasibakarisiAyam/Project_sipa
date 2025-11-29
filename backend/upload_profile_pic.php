<?php
require "koneksi.php";

session_start();
if (!isset($_SESSION['user']['id'])) {
    echo json_encode(["status" => "error", "message" => "User not logged in."]);
    exit;
}

$user_id = $_SESSION['user']['id'];

// Cek apakah ada file yang diupload
if (!isset($_FILES['profile_pic'])) {
    echo json_encode(["status" => "error", "message" => "No file uploaded."]);
    exit;
}

// Ambil path foto lama dari database
$get_old = $conn->prepare("SELECT profile_pic_path FROM users WHERE id=?");
$get_old->bind_param("i", $user_id);
$get_old->execute();
$get_old->bind_result($old_pic);
$get_old->fetch();
$get_old->close();

// Folder penyimpanan
$target_dir = "uploads/profile_pics/";
if (!is_dir("../" . $target_dir)) {
    mkdir("../" . $target_dir, 0777, true);
}

// Buat nama file unik & aman
$original_name = basename($_FILES["profile_pic"]["name"]);
$safe_name = preg_replace("/[^A-Za-z0-9.\-_]/", "", $original_name);
$file_name = time() . "_" . $safe_name;
$target_file = $target_dir . $file_name;

// Validasi file benar-benar gambar
$check = getimagesize($_FILES["profile_pic"]["tmp_name"]);
if ($check === false) {
    echo json_encode(["status" => "error", "message" => "Uploaded file is not a valid image."]);
    exit;
}

// Validasi ukuran file max 2MB
if ($_FILES["profile_pic"]["size"] > 2 * 1024 * 1024) {
    echo json_encode(["status" => "error", "message" => "File too large. Max 2MB allowed."]);
    exit;
}

// Validasi extension
$imageFileType = strtolower(pathinfo($target_file, PATHINFO_EXTENSION));
$allowed_types = ["jpg", "jpeg", "png", "gif"];
if (!in_array($imageFileType, $allowed_types)) {
    echo json_encode(["status" => "error", "message" => "Only JPG, JPEG, PNG & GIF files are allowed."]);
    exit;
}

// Upload file ke server
if (move_uploaded_file($_FILES["profile_pic"]["tmp_name"], "../" . $target_file)) {
    // Hapus foto lama jika ada & bukan default
    if ($old_pic && file_exists("../" . $old_pic) && $old_pic != "uploads/profile_pics/default.png") {
        unlink("../" . $old_pic);
    }

    // Update database
    $sql = $conn->prepare("UPDATE users SET profile_pic_path = ? WHERE id = ?");
    $sql->bind_param("si", $target_file, $user_id);

    if ($sql->execute()) {
        // Update session biar langsung terpakai
        $_SESSION['user']['profile_pic_path'] = $target_file;

        echo json_encode([
            "status" => "success",
            "profile_pic_path" => $target_file
        ]);
    } else {
        echo json_encode(["status" => "error", "message" => "Database update failed."]);
    }

    $sql->close();
} else {
    echo json_encode(["status" => "error", "message" => "Failed to upload file."]);
}
?>
