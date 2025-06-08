<?php 
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
$bid = isset($_GET['bid']) ? (int) $_GET['bid'] : 0;

    $user = $conn->prepare("SELECT
    b.blog_id,
    b.blog_title,
    b.blog_content,
    b.blog_image
FROM newblogs b
where blog_id = $bid
");
$user->execute();               // Execute the query
$user->store_result();          // Store the result
$user->bind_result($blog_id, $blog_title, $blog_content, $blog_image);
$user->fetch();
?>
    <h1 class="flex justify-center text-2xl font-bold mt-4">Edit Blog Post, <?= htmlspecialchars($blog_title) ?></h1>
    <form class="space-y-4 font-[sans-serif] max-w-md mx-auto mt-4 mb-4" action="update-blog?bid=<?= $bid ?>" method="post" enctype="multipart/form-data">
      <p>ID: <?= $bid ?></p>
      <input type="text" name="title" value="<?= $blog_title ?>"
        class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded" />

        <textarea name="content" class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"><?= $blog_content ?></textarea>

        

      <button type="submit"
        class="!mt-8 w-full px-4 py-2.5 mx-auto block text-sm bg-blue-500 text-white rounded hover:bg-blue-600">Submit</button>
    </form>
<?php include 'components/footer.php' ?>

