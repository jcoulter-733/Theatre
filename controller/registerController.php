<?php
include 'database/config.php';
session_start();

// Input sanitization, taking away any spaces
$username = trim($_POST['username']);
$email = trim($_POST['email']);
$password = trim($_POST['password']);
// $created_at = trim($_POST['created_at']);
// $role = trim($_POST['role']);

// Validate username characters
if (!preg_match("/^[a-zA-Z0-9]*$/", $username)) {
  $_SESSION['status_message'] = 'Username can only contain letters and numbers';
  header('Location: register');
  exit();
}

// Validate password length
if(strlen($password) < 8 || strlen($password) > 16) {
  $_SESSION['status_message'] = 'Password must be between 8 and 16 characters';
  header('Location: register');
  exit();
}

// Validate email (basic validation, can be expanded)
if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    $_SESSION['status_message'] = 'Invalid email format!';
    header('Location: register');
    exit();
}

$stmt = $conn->prepare("SELECT user_id FROM users WHERE email = ? OR username = ?");
$stmt->bind_param('ss', $email, $username);

$stmt->execute();
$stmt->store_result();

if ($stmt->num_rows > 0) {
  $_SESSION['status_message'] = 'Email or username already exists';
  header('Location: register');
  exit();
} else {
    $stmt-> close();

    // Email doesn't exist. create new account
    $stmt = $conn->prepare("INSERT INTO users (username, email, password_hash, role, status) VALUES (?, ?, ?, 'user', 'active')");

    // Hash the password for security
    $hashed_password = password_hash($password, PASSWORD_DEFAULT);

    // Bind parameters and execute query 
    if($stmt){
        $stmt->bind_param("sss", $username, $email, $hashed_password);
        $stmt->execute();

        // If account creation successful
        if($stmt->affected_rows > 0){
            $_SESSION['status_message'] = 'Account created successfully, Please login';
            header('Location: login');           
        } else {
            $_SESSION['status_message'] = 'Error creating account';
            header('Location: register');            
        }
        $stmt->close();
    } else {
        $_SESSION['status_message'] = 'Database error';
        header('Location: register');
    }

    $conn->close();
    exit();

}
?>
<!-- Status Message -->
<?php if (isset($_SESSION['status_message'])) : ?>
    <div><?= $_SESSION['status_message'] ?></div>
<?php unset($_SESSION['status_message']) ?>
<?php endif?>
