<?php
$envFile = __DIR__ . '/backend/.env';
echo "Env file path: $envFile\n";
echo "File exists: " . (file_exists($envFile) ? 'Yes' : 'No') . "\n";
if (file_exists($envFile)) {
  $lines = file($envFile, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
  foreach ($lines as $line) {
    echo "Line: $line\n";
  }
}
echo "DB_PASS from getenv: '" . getenv('DB_PASS') . "'\n";
?>
