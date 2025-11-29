<?php
// Load local .env (if present) into environment for local dev
$envFile = __DIR__ . '/.env';
if (file_exists($envFile)) {
  $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
  foreach ($lines as $line) {
    $line = trim($line);
    if ($line === '' || $line[0] === '#') continue;
    if (strpos($line, '=') === false) continue;
    list($k, $v) = explode('=', $line, 2);
    $k = trim($k);
    $v = trim($v);
    $v = trim($v, "\"'");
    if (getenv($k) === false) {
      putenv("$k=$v");
      $_ENV[$k] = $v;
    }
  }
}

// Read DB credentials from environment or sensible defaults
$servername = getenv('DB_HOST') ?: 'localhost';
$user = getenv('DB_USER') ?: 'root';
$pass = getenv('DB_PASS') !== false ? getenv('DB_PASS') : '';
$db = getenv('DB_NAME') ?: 'bookflix';

// Enable mysqli exceptions for clearer error handling
if (function_exists('mysqli_report')) {
  mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
}

try {
  $conn = new mysqli($servername, $user, $pass, $db);
  $conn->set_charset('utf8mb4');
} catch (Throwable $e) {
  // Friendly error, avoid leaking credentials
  die('Database connection failed: ' . $e->getMessage());
}
?>