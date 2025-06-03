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
    'edit-user' => 'pages/admin/edit_user.php', // admin page route
    'edit-blogs' => 'pages/admin/blog-management.php', // admin page route
    'add-blog' => 'pages/admin/create-blog.php', // admin page route


    // controllers
    'registerController' => 'controller/registerController.php', // register controller
    'loginController' => 'controller/loginController.php', // login controller
    'logoutController' => 'controller/logoutController.php', // logout controller
    'commentController' => 'controller/commentController.php',
    'commentControllerSanitise' => 'controller/commentControllerSanitise.php',
    'admin/approve' => 'controller/approveController.php', // admin page route
    'admin/reject' => 'controller/rejectController.php', // admin page route
    'admin/edit' => 'controller/userEditController.php', // admin page route
    'admin/delete-user' => 'controller/userDeleteController.php', // admin page route
    'add-blog-config' => 'controller/addBlogController.php', // admin page route
    'unpublish-blog' => 'controller/unpublishBlogController.php', // admin page route
    'edit-user-config' => 'controller/userEditController.php', // admin page route
    'publish-blog' => 'controller/publishBlogController.php', // admin page route

];

// Check if the URL matches a route
if (array_key_exists($url, $routes)) {
    require $routes[$url];  // Load the appropriate file for the route
} else {
    // If no route matches, show a 404 page
    require 'pages/error_404.php';
}
?>