<?php
$hn = "localhost";
$un = "theatre_admin";
$pw = "s7Dxr.irSKOXO9FN";
$db = "theatre";
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Create database connection
$conn = new mysqli($hn, $un, $pw, $db);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $db->connect_error);
} else{
    //echo 'Connection succsesful';
}


?>