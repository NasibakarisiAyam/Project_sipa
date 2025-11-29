<?php
// File: backend/get_books.php

// 1. Sertakan file koneksi database
require 'koneksi.php';

// 2. Siapkan query untuk mengambil semua buku
$sql = "SELECT id, title, author, year, rating, genre, synopsis, cover_path AS cover FROM books ORDER BY title ASC";

$result = $conn->query($sql);

// 3. Proses hasil query
$books = [];
if ($result->num_rows > 0) {
    // Ambil setiap baris data dan masukkan ke dalam array $books
    while($row = $result->fetch_assoc()) {
        // Konversi tipe data jika perlu, misal id ke integer
        $row['id'] = (int)$row['id'];
        $books[] = $row;
    }
}

// 4. Tutup koneksi database
$conn->close();

// 5. Atur header respons sebagai JSON dan cetak hasilnya
header('Content-Type: application/json');
echo json_encode(['status' => 'success', 'books' => $books]);
?>
