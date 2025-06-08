<?php
session_start();
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

include 'database/Config.php';

$bid = isset($_GET['bid']) ? (int) $_GET['bid'] : 0;

    // Prepare the statement with a placeholder
    $approve = $conn->prepare("UPDATE 
    newblogs SET 
    blog_title = ? ,
    blog_content = ?,
    blog_image = ?
    WHERE blog_id = ?");
    
    // Bind the parameter (i = integer)
    $approve->bind_param("sssi", $_POST['title'], $_POST['content'], $_POST['file'], $bid);
    
    // Execute the query
    if ($approve->execute()) {
        $_SESSION['status_message'] = "Blog updated successfully!";
    } else {
        $_SESSION['status_message'] = "Error: " . $conn->error;
    }
    
    // Close the statement
    $approve->close();


// Redirect back to the comments page

header("Location: edit-blogs");
exit;
