<?php
session_start();

if (isset($_SESSION['user'])) {
    header('Content-Type: application/json');
    echo json_encode(['status' => 'success', 'user' => $_SESSION['user']]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
}
?>