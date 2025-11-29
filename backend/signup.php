<?php
require "koneksi.php";

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $fullname = $_POST['fullname'];
    $username = $_POST['username'];
    $email    = $_POST['email'];
    $nis      = $_POST['nis'];
    $password = $_POST['password'];

    // cek apakah username/email sudah ada
    $check = $conn->prepare("SELECT id FROM users WHERE username=? OR email=? OR nis=?");
    $check->bind_param("sss", $username, $email, $nis);
    $check->execute();
    $check->store_result();

    if ($check->num_rows > 0) {
        echo json_encode(["status" => "exists"]);
        exit;
    }

    // insert user baru
    $stmt = $conn->prepare("INSERT INTO users (fullname, username, email, nis, password) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param("sssss", $fullname, $username, $email, $nis, $password);

    if ($stmt->execute()) {
        echo json_encode(["status" => "success"]);
    } else {
        echo json_encode(["status" => "error", "message" => $conn->error]);
    }
}
?>