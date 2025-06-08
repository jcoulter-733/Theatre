<?php
include 'database/config.php';
session_start();

// Ensure that the cid is sanitized or validated as an integer
$sid = isset($_GET['sid']) ? (int) $_GET['sid'] : 0;


    $delete_show = $conn->prepare("DELETE 
    FROM shows
    WHERE show_id = ?");
  
    
    // Bind the parameter (i = integer)
    $delete_show->bind_param("i", $sid);
    
    // Execute the query
    if ($delete_show->execute()) {
        $_SESSION['status_message'] = "Show deleted successfully!";
    } else {
        $_SESSION['status_message'] = "Error: " . $conn->error;
    }
    
    // Close the statement
    $delete_show->close();

// Redirect back to the shows management page
header("Location: show-management");
exit();
?>