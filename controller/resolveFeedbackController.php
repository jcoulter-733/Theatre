<?php
include 'database/config.php';
session_start();

// Ensure that the cid is sanitized or validated as an integer
$fid = isset($_GET['fid']) ? (int) $_GET['fid'] : 0;

$userid = isset($_SESSION['id']) ? (int) $_SESSION['id'] : 0;

// Prepare the statement with a placeholder
$resolve = $conn->prepare("UPDATE feedback SET feedback_status = 'resolved', feedback_admin_id = ? WHERE feedback_id = ?");
$resolve->bind_param("ii", $userid, $fid);

// Execute the query
if ($resolve->execute()) {
    $_SESSION['status_message'] = "Resolved successfully!";
} else {
        $_SESSION['status_message'] = "Error: " . $conn->error;
    }
    
    // Close the statement
    $resolve->close();


// Redirect back to the comments page
header("Location: view-feedback");
exit();
?>