<?php
$hn = "localhost";
$un = "theatre_admin";
$pw = "s7Dxr.irSKOXO9FN";
$db = "theatre";

// Create database connection
$conn = new mysqli($hn, $un, $pw, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $db->connect_error);
} else{
    //echo 'Connection succsesful';
}


?>