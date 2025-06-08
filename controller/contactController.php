<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'database/config.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header('Location: contact-us');
    exit;
}


$name    = trim($_POST['name']    ?? '');
$email   = trim($_POST['email']   ?? '');
$message = trim($_POST['message'] ?? '');


$errors = [];
if ($name === '')    $errors[] = 'Name is required.';
if ($email === '')   $errors[] = 'Email is required.';
if ($message === '') $errors[] = 'Message is required.';

if (!empty($errors)) {
    
    foreach ($errors as $err) {
        echo "<p style='color:red;'>".htmlspecialchars($err)."</p>";
    }
    exit;
}


$stmt = $conn->prepare(
    "INSERT INTO feedback
       (feedback_name, feedback_email, feedback_message, feedback_time_sent)
     VALUES (?, ?, ?, NOW())"
);
if (! $stmt) {
    die("Prepare failed: " . htmlspecialchars($conn->error));
}


$stmt->bind_param(
    'sss',
    $name,
    $email,
    $message
);

if ($stmt->execute()) {
    $_SESSION['statusMsg'] = "Your feedback has been submitted successfully.";
} else {
    $_SESSION['statusMsg'] = "Error submitting feedback: " . htmlspecialchars($stmt->error);
}

$stmt->close();

// Redirect back to the form
header("Location: feedback");
exit;
