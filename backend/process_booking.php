<?php
ob_clean();
session_start();
require 'koneksi.php';

header('Content-Type: application/json');

// 1. Keamanan: Pastikan pengguna sudah login
if (!isset($_SESSION['user']['id'])) {
    echo json_encode(['status' => 'error', 'message' => 'Anda harus login untuk dapat melakukan booking.']);
    exit;
}

// 2. Validasi Input: Pastikan data yang dibutuhkan terkirim
if (!isset($_POST['book_id'], $_POST['booking_date'], $_POST['duration'])) {
    echo json_encode(['status' => 'error', 'message' => 'Data tidak lengkap. Pastikan Anda memilih tanggal dan durasi.']);
    exit;
}

// 3. Ambil dan bersihkan data
$user_id = $_SESSION['user']['id']; // Ambil user_id dari sesi
$book_id = (int)$_POST['book_id'];
$booking_date_str = $_POST['booking_date'];
$duration = (int)$_POST['duration'];

// Validasi lebih lanjut
if ($duration < 1 || $duration > 7) {
    echo json_encode(['status' => 'error', 'message' => 'Durasi peminjaman tidak valid (harus antara 1-7 hari).']);
    exit;
}

if ($book_id <= 0) {
    echo json_encode(['status' => 'error', 'message' => 'ID buku tidak valid.']);
    exit;
}

// 4. Hitung tanggal pengembalian (due_date)
try {
    $booking_date = new DateTime($booking_date_str);
    $due_date = clone $booking_date;
    $due_date->add(new DateInterval("P{$duration}D"));
    $due_date_str = $due_date->format('Y-m-d');
} catch (Exception $e) {
    echo json_encode(['status' => 'error', 'message' => 'Format tanggal tidak valid.']);
    exit;
}

// 5. Masukkan data ke database
// $status = 'Dipinjam'; // Status default untuk peminjaman baru

$stmt = $conn->prepare(
    "INSERT INTO bookings (user_id, book_id, booking_date, due_date, duration) VALUES (?, ?, ?, ?, ?)"
);

if ($stmt === false) {
    echo json_encode(['status' => 'error', 'message' => 'MySQL prepare error: ' . $conn->error]);
    exit;
}

// Bind parameter ke query
$stmt->bind_param("iisss", $user_id, $book_id, $booking_date_str, $due_date_str, $duration);

// 6. Eksekusi dan beri feedback
if ($stmt->execute()) {
    // Fetch book title for the response
    $bookTitle = '';
    $stmt_book = $conn->prepare("SELECT title FROM books WHERE id = ?");
    $stmt_book->bind_param("i", $book_id);
    $stmt_book->execute();
    $result_book = $stmt_book->get_result();
    if ($result_book->num_rows > 0) {
        $row_book = $result_book->fetch_assoc();
        $bookTitle = $row_book['title'];
    }
    $stmt_book->close();

    echo json_encode([
        'status' => 'success',
        'message' => 'Buku telah berhasil dipinjam.',
        'book_title' => $bookTitle,
        'booking_date' => $booking_date_str,
        'due_date' => $due_date_str,
        'duration' => $duration
    ]);
} else {
    echo json_encode(['status' => 'error', 'message' => 'Gagal menyimpan data peminjaman: ' . $stmt->error]);
}

$stmt->close();
$conn->close();
?>
