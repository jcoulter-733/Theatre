<?php
include 'database/config.php';
session_start();
$blogId = $_GET['bid'];
$userId = $_GET['uid'];

$insertComment = $conn->prepare("INSERT INTO blog_comment (content, blog_id, user_id) VALUES (?, ?, ?)");

// Bind parameters to prevent SQL injection
$insertComment->bind_param("sii", $_POST['content'], $blogId, $userId);

// Execute the query
if ($insertComment->execute()) {
    $_SESSION['status_message'] = "Comment added successfully!";
} else {
    $_SESSION['status_message'] = "Error: " . $conn->error;
}

// Close statement
$insertComment->close();
        
    

    // Redirect back to the blog page
    header("Location: blogInfo?bid=" . $blogId);
    exit();