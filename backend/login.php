<?php
ob_clean();
session_start();
include 'koneksi.php';

if(!isset($_POST['username'], $_POST['password'])){
    echo "notfound";
    exit;
}

$username = $_POST['username'];
$password = $_POST['password'];

// Cari user berdasarkan username
$stmt = $conn->prepare("SELECT * FROM users WHERE username=? LIMIT 1");
$stmt->bind_param("s", $username);
$stmt->execute();
$result = $stmt->get_result();

if($result->num_rows === 1){
    $row = $result->fetch_assoc();
    if($password === $row['password']){
        $_SESSION['user'] = $row;
        echo "success";
        exit;
    } else {
        echo "wrongpass";
        exit;
    }
} else {
    echo "notfound";
    exit;
}

$conn->close();