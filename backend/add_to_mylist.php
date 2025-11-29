<?php
session_start();
require 'koneksi.php';

// Enable exception reporting for mysqli
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

header('Content-Type: application/json');

if (!isset($_SESSION['user']['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'User not logged in.']);
    exit();
}

if (!isset($_POST['book_id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Book ID is required.']);
    exit();
}

$user_id = $_SESSION['user']['id'];
$book_id = (int)$_POST['book_id'];

if ($book_id <= 0) {
    echo json_encode(['status' => 'error', 'message' => 'Invalid Book ID.']);
    exit();
}

try {
    // Check if the book is already in the user's list
    $stmt = $conn->prepare("SELECT id FROM my_lists WHERE user_id = ? AND book_id = ?");
    $stmt->bind_param("ii", $user_id, $book_id);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        echo json_encode(['status' => 'error', 'message' => 'Book already in your list.']);
        $stmt->close();
        $conn->close();
        exit();
    }
    $stmt->close();

    // Add the book to the list
    $stmt = $conn->prepare("INSERT INTO my_lists (user_id, book_id, added_date) VALUES (?, ?, NOW())");
    $stmt->bind_param("ii", $user_id, $book_id);

    if ($stmt->execute()) {
        echo json_encode(['status' => 'success', 'message' => 'Book added to your list.']);
    } else {
        // This else might be redundant with exceptions enabled, but good for safety
        echo json_encode(['status' => 'error', 'message' => 'Failed to add book to list.']);
    }

    $stmt->close();
    $conn->close();

} catch (mysqli_sql_exception $e) {
    // Catch SQL errors (like table not found) and return as JSON
    echo json_encode([
        'status' => 'error', 
        'message' => 'Database error: ' . $e->getMessage()
    ]);
    if (isset($conn) && $conn->ping()) {
        $conn->close();
    }
    exit();
}
?>