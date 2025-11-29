<?php
session_start();
require 'koneksi.php';

header('Content-Type: application/json');

if (!isset($_SESSION['user']['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in.']);
    exit();
}

$user_id = $_SESSION['user']['id'];

// Select book data, ensuring the book's ID is the main 'id' field for frontend compatibility
$sql = "SELECT 
            bk.id, 
            bk.title, 
            bk.author, 
            bk.year, 
            bk.rating, 
            bk.genre, 
            bk.synopsis, 
            bk.cover_path AS cover, 
            ml.added_date
        FROM my_lists ml
        JOIN books bk ON ml.book_id = bk.id
        WHERE ml.user_id = ?
        ORDER BY ml.added_date DESC";

$stmt = $conn->prepare($sql);

if ($stmt === false) {
    echo json_encode(['status' => 'error', 'message' => 'Database prepare error: ' . $conn->error]);
    exit();
}

$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$my_list_books = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $my_list_books[] = $row;
    }
}

echo json_encode(['status' => 'success', 'my_list' => $my_list_books]);

$stmt->close();
$conn->close();
?>