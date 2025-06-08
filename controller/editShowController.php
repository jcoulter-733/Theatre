<?php
session_start();
ini_set('display_errors', 1);
error_reporting(E_ALL);


include 'database/config.php';

$sid   = isset($_GET['sid']) ? (int)$_GET['sid'] : 0;
$name  = $_POST['name'];
$info  = $_POST['info'];
$type  = $_POST['type'];
$date  = $_POST['date'];
$old   = $_POST['show_image'];   // from the hidden input
$file  = $old;                   // default to old image

// If a file was uploaded without error, normalize + move it:
if (isset($_FILES['image']) && $_FILES['image']['error'] === UPLOAD_ERR_OK) {
// Change the file name to match show
    $origExt = pathinfo($_FILES['image']['name'], PATHINFO_EXTENSION);
    $ext = strtolower($origExt);


    $base = preg_replace('/[^A-Za-z0-9 ]+/', '', $name);  // strip weird chars
    $base = preg_replace('/\s+/', '_', $base);            
    $base = strtolower($base);


    $file = $base . ($ext ? '.' . $ext : '');


    $tmpPath = $_FILES['image']['tmp_name'];
    $destDir = __DIR__ . '/../assets/images/';
    if (!is_dir($destDir)) mkdir($destDir, 0755, true);
    move_uploaded_file($tmpPath, $destDir . $file);
}


$stmt = $conn->prepare("
  UPDATE shows
    SET show_name  = ?,
        show_info  = ?,
        show_type  = ?,
        show_image = ?,
        date_shown = ?
  WHERE show_id = ?
");
$stmt->bind_param("sssssi",
  $name,
  $info,
  $type,
  $file,
  $date,
  $sid
);

if ($stmt->execute()) {
  $_SESSION['status_message'] = "Show updated successfully!";
} else {
  $_SESSION['status_message'] = "Error: " . $stmt->error;
}
$stmt->close();

header("Location: show-management");
exit;


function normalize_string($str) {

  $base = pathinfo($str, PATHINFO_FILENAME);
  $ext  = pathinfo($str, PATHINFO_EXTENSION);

  $base = preg_replace('/[^A-Za-z0-9 ]+/', '', $base);
  $base = preg_replace('/\s+/', '_', $base);
  $base = strtolower($base);
  $ext  = strtolower($ext);

  return $ext
    ? "{$base}.{$ext}"
    : $base;
}
