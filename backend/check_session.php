<?php
@session_start();

header('Content-Type: application/json');

if (isset($_SESSION['user']) && isset($_SESSION['user']['id'])) {
    echo json_encode([
        'status' => 'success',
        'user' => $_SESSION['user']
    ]);
} else {
    echo json_encode([
        'status' => 'error',
        'message' => 'User not logged in.'
    ]);
}
?>