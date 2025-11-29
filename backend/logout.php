<?php
// File: backend/logout.php

// 1. Mulai sesi untuk mengakses data sesi yang ada.
session_start();

// 2. Hapus semua variabel sesi.
$_SESSION = array();

// 3. Hancurkan sesi.
// Ini akan menghapus cookie sesi juga.
session_destroy();

// 4. Arahkan pengguna kembali ke halaman login setelah logout.
header("Location: ../index.html");
exit;
?>
