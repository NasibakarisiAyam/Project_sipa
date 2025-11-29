<?php
session_start();
require 'koneksi.php';

if (!isset($_SESSION['user']['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in']);
    exit;
}

$user_id = $_SESSION['user']['id'];

$sql = "SELECT 
            b.id AS booking_id, 
            b.booking_date, 
            b.due_date, 
            b.duration, 
            bk.id AS book_id, 
            bk.title, 
            bk.author, 
            bk.year, 
            bk.rating, 
            bk.genre, 
            bk.synopsis, 
            bk.cover_path AS cover 
        FROM bookings b
        JOIN books bk ON b.book_id = bk.id
        WHERE b.user_id = ?
        ORDER BY b.booking_date DESC";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $user_id);
$stmt->execute();
$result = $stmt->get_result();

$bookings = [];
if ($result->num_rows > 0) {
    while($row = $result->fetch_assoc()) {
        $bookings[] = $row;
    }
}

header('Content-Type: application/json');
echo json_encode(['status' => 'success', 'bookings' => $bookings]);

$stmt->close();
$conn->close();
?>