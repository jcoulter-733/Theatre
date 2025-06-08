<?php 
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
    $uid = isset($_GET['uid']) ? (int) $_GET['uid'] : 0;

    $user = $conn->prepare("SELECT
    u.username,
    u.email,
    u.role
FROM users u
where user_id = $uid
");
$user->execute();               // Execute the query
$user->store_result();          // Store the result
$user->bind_result($username, $email, $role);
$user->fetch();
?>
    <h1 class="flex justify-center text-2xl font-bold mt-4">Edit User, <?= htmlspecialchars($username) ?></h1>
    <form class="space-y-4 font-[sans-serif] max-w-md mx-auto mt-4 mb-4" action="edit-user-config?uid=<?= $uid ?>" method="post">
      <p>ID: <?= $uid ?></p>
      <input type="text" name="username" value="<?= $username ?>"
        class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded" />

        <input type="text" name="email" value="<?= $email ?>"
        class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-transparent focus:border-blue-500 rounded" />

        <select name="role" class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-transparent focus:border-blue-500 rounded">
            <option value="<?= $role ?>" selected><?= ucfirst($role) ?></option>
            <?php if ($role === 'user') : ?>
                <option value="admin">Admin</option>
            <?php else : ?>

            <option value="user">User</option>
            <?php endif; ?>
        </select>

      <button type="submit"
        class="!mt-8 w-full px-4 py-2.5 mx-auto block text-sm bg-blue-500 text-white rounded hover:bg-blue-600">Submit</button>
    </form>
<?php include 'components/footer.php' ?>