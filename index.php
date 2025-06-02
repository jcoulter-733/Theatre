<?php


// Get the requested URL from the 'url' query parameter
$url = isset($_GET['url']) ? rtrim($_GET['url'], '/') : '';

// Define available routes (URL => corresponding PHP file)
$routes = [
    '' => 'pages/home.php', // Home route
    'home' => 'pages/home.php',          // Home Page
    'contact' => 'pages/contact.php',          // contact route
    'register' => 'pages/register.php',    // register page route
    'login' => 'pages/login.php', // login page route
    'blog-list' => 'pages/blog-list.php', // blog page route (home)
    'blog' => 'pages/blog-single.php', // Individual Blog Page route
    'show-list' => 'pages/show-list.php', // Show list route
    'show' => 'pages/show-single.php',
    'admin' => 'pages/admin/dashboard.php', // admin page route
    'user' => 'pages/user/dashboard.php',
    'feedback' => 'pages/feedback.php', // user page route
    // controllers
    'registerController' => 'controller/registerController.php', // register controller
    'loginController' => 'controller/loginController.php', // login controller
];

// Check if the URL matches a route
if (array_key_exists($url, $routes)) {
    require $routes[$url];  // Load the appropriate file for the route
} else {
    // If no route matches, show a 404 page
    require 'pages/error_404.php';
}
?>