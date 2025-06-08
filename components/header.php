<?php
define('ROOT_DIR', '/johnc/theatre/');

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

error_reporting(E_ALL);
ini_set('display_errors', 1);
?>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>The Theatre Company</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <link rel="stylesheet" href="<?= ROOT_DIR ?>assets/css/style.css"/>
</head>
<body class="flex flex-col min-h-screen bg-slate-800 text-yellow-500">

  <header class="bg-slate-800 border-b-2 border-yellow-500 relative z-50">
    <div class="container mx-auto flex items-center justify-between px-4 py-4">
      <!-- Logo + Title -->
      <a href="<?= ROOT_DIR ?>home" class="flex items-center space-x-2">
        <img src="<?= ROOT_DIR ?>assets/images/clyde_theatre_tp.png"
             alt="logo"
             class="h-14 w-14"/>
        <span class="hidden sm:inline text-xl font-bold">
          The Theatre Company
        </span>
      </a>

      <!-- Desktop nav -->
      <ul class="hidden lg:flex space-x-6">
        <li><a href="<?= ROOT_DIR ?>home"       class="hover:text-yellow-200">Home</a></li>
        <li><a href="<?= ROOT_DIR ?>blog-list"  class="hover:text-yellow-200">Blog</a></li>
        <li><a href="<?= ROOT_DIR ?>show-list"  class="hover:text-yellow-200">Shows</a></li>

        <?php if (!empty($_SESSION['loggedin'])): ?>
          <?php if ($_SESSION['role'] === 'admin'): ?>
            <li><a href="<?= ROOT_DIR ?>admin"           class="hover:text-yellow-200">Dashboard</a></li>
            <li><a href="<?= ROOT_DIR ?>comments"        class="hover:text-yellow-200">Comments</a></li>
            <li><a href="<?= ROOT_DIR ?>edit-blogs"      class="hover:text-yellow-200">Edit Blogs</a></li>
            <li><a href="<?= ROOT_DIR ?>add-blog"        class="hover:text-yellow-200">Add Blogs</a></li>
            <li><a href="<?= ROOT_DIR ?>show-management" class="hover:text-yellow-200">Edit Shows</a></li>
            <li><a href="<?= ROOT_DIR ?>new-show"        class="hover:text-yellow-200">Add Shows</a></li>
            <li><a href="<?= ROOT_DIR ?>view-feedback"   class="hover:text-yellow-200">View Feedback</a></li>
          <?php elseif ($_SESSION['role'] === 'user'): ?>
            <li><a href="<?= ROOT_DIR ?>user" class="hover:text-yellow-200">Dashboard</a></li>
          <?php endif; ?>

          <li>
            <a href="<?= ROOT_DIR ?>logoutController"
               class="hover:text-yellow-200">
              Logout (<?= htmlspecialchars($_SESSION['username']) ?>)
            </a>
          </li>
        <?php else: ?>
          <li><a href="<?= ROOT_DIR ?>login"    class="hover:text-yellow-200">Login</a></li>
          <li><a href="<?= ROOT_DIR ?>register" class="hover:text-yellow-200">Sign Up</a></li>
        <?php endif; ?>

        <li><a href="<?= ROOT_DIR ?>contact" class="hover:text-yellow-200">Contact</a></li>
      </ul>

      <!-- Mobile toggle -->
      <button id="navToggle" class="lg:hidden focus:outline-none">
        <svg class="h-6 w-6" fill="currentColor" viewBox="0 0 20 20">
          <path fill-rule="evenodd"
                d="M3 5h14a1 1 0 010 2H3a1 1 0 010-2zm0 4h14a1 1 0 010 2H3a1 1 0 010-2zm0 4h14a1 1 0 010 2H3a1 1 0 010-2z"
                clip-rule="evenodd"/>
        </svg>
      </button>
    </div>

    <!-- Mobile nav -->
    <nav id="mobileMenu" class="hidden lg:hidden bg-slate-700">
      <ul class="space-y-4 p-4">
        <li><a href="<?= ROOT_DIR ?>home"       class="block hover:text-yellow-200">Home</a></li>
        <li><a href="<?= ROOT_DIR ?>blog-list"  class="block hover:text-yellow-200">Blog</a></li>
        <li><a href="<?= ROOT_DIR ?>show-list"  class="block hover:text-yellow-200">Shows</a></li>

        <?php if (!empty($_SESSION['loggedin'])): ?>
          <?php if ($_SESSION['role'] === 'admin'): ?>
            <li><a href="<?= ROOT_DIR ?>admin"           class="block hover:text-yellow-200">Dashboard</a></li>
            <li><a href="<?= ROOT_DIR ?>comments"        class="block hover:text-yellow-200">Comments</a></li>
            <li><a href="<?= ROOT_DIR ?>edit-blogs"      class="block hover:text-yellow-200">Edit Blogs</a></li>
            <li><a href="<?= ROOT_DIR ?>add-blog"        class="block hover:text-yellow-200">Add Blogs</a></li>
            <li><a href="<?= ROOT_DIR ?>show-management" class="block hover:text-yellow-200">Edit Shows</a></li>
            <li><a href="<?= ROOT_DIR ?>new-show"        class="block hover:text-yellow-200">Add Shows</a></li>
            <li><a href="<?= ROOT_DIR ?>view-feedback"   class="block hover:text-yellow-200">View Feedback</a></li>
          <?php elseif ($_SESSION['role'] === 'user'): ?>
            <li><a href="<?= ROOT_DIR ?>user" class="block hover:text-yellow-200">Dashboard</a></li>
          <?php endif; ?>

          <li>
            <a href="<?= ROOT_DIR ?>logoutController"
               class="block hover:text-yellow-200">
              Logout (<?= htmlspecialchars($_SESSION['username']) ?>)
            </a>
          </li>
        <?php else: ?>
          <li><a href="<?= ROOT_DIR ?>login"    class="block hover:text-yellow-200">Login</a></li>
          <li><a href="<?= ROOT_DIR ?>register" class="block hover:text-yellow-200">Sign Up</a></li>
        <?php endif; ?>

        <li><a href="<?= ROOT_DIR ?>contact" class="block hover:text-yellow-200">Contact</a></li>
      </ul>
    </nav>

    <script>
      document.getElementById('navToggle').addEventListener('click', () => {
        document.getElementById('mobileMenu').classList.toggle('hidden');
      });
    </script>
  </header>

  <main class="flex-grow">
    <!-- page content… -->
