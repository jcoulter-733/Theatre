<?php
/* core/auth.php
 * Centralised helpers for login / role checks
 */

if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

/**
 * Stop execution unless the user is logged-in.
 * Redirects to login page by default.
 */
function requireLogin(string $redirect = 'login'): void
{
    if (empty($_SESSION['loggedin'])) {
        header("Location: $redirect");
        exit;
    }
}

/**
 * Stop execution unless the user is logged-in **and** has one
 * of the allowed roles (single role or array of roles).
 */
function requireRole(string|array $roles, string $redirect = 'not-allowed'): void
{
    requireLogin();                       // first make sure they *are* logged-in

    $roles = (array) $roles;              // normalise
    if (!in_array($_SESSION['role'] ?? '', $roles, true)) {
        http_response_code(403);          // optional: send proper status
        header("Location: $redirect");
        exit;
    }
}
