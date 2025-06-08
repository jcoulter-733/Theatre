<?php
// Include database configuration and header
include 'components/header.php';
include 'database/config.php';

// Prepare the SQL query to fetch comments along with blog and user data
$uid = $_SESSION['id']; // Get the user ID from the session
$comments = $conn->prepare("SELECT
  c.user_id,
  c.comment_content,
  c.comment_created,
  c.comment_status,
  u.username,
  b.blog_title,
  b.blog_image
FROM blog_comments c
INNER JOIN users u ON c.user_id    = u.user_id
INNER JOIN newblogs b ON c.blog_id = b.blog_id
WHERE c.user_id = ?
ORDER BY
  CASE
    WHEN c.comment_status = 'pending'   THEN 1
    WHEN c.comment_status = 'published' THEN 2
    WHEN c.comment_status = 'rejected'  THEN 3
  END");
$comments->bind_param("i", $uid); // Bind the user ID parameter to the query
$comments->execute(); // Execute the query
$comments->store_result(); // Store the result for later use
$comments->bind_result($commentId, $comment, $created, $commentStatus, $username, $blogTitle, $blogImg); // Bind the results to variables
?>
<section class="">
    <div class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 lg:px-8 lg:py-16">
        <!-- Section heading -->
        <h2 class="text-center text-m font-semibold tracking-tight text-yellow-500 sm:text-5xl">
            Comments from <?= htmlspecialchars($_SESSION['username']) ?>
        </h2>

        <div class="mt-8 grid grid-cols-1 gap-4 md:grid-cols-3 md:gap-8">
            <!-- Loop through each comment -->
            <?php while ($comments->fetch()) : ?>
                <blockquote class="rounded-lg bg-gray-50 p-6 shadow-xs sm:p-8">
                    <div class="flex items-center gap-4">
                        <!-- Display blog image -->
                        <img
                            alt=""
                            src="<?= ROOT_DIR ?>assets/images/<?= htmlspecialchars($blogImg) ?>"
                            class="size-14 rounded-full object-cover" />

                        <div>
                            <!-- Display blog title -->
                            <p class="mt-0.5 text-lg font-medium text-gray-900"><?= htmlspecialchars($blogTitle) ?></p> <!-- Escape blog name -->
                        </div>
                    </div>

                    <!-- Display the comment content -->
                    <p class="mt-4 text-gray-700">
                        <?= htmlspecialchars($comment) ?> <!-- Escape comment content -->
                    </p>
                    <div>
                        <!-- Display the first name of the commenter -->
                        <p class="mt-4 text-gray-700">Comment by <?= htmlspecialchars($username) ?></p> <!-- Escape first name -->
                    </div>

                    <!-- Display the status of the comment (pending, approved, rejected) with appropriate styling -->
                    <span class="inline-flex items-center justify-center rounded-full px-2.5 py-0.5 text-emerald-700 <?php if ($commentStatus === 'pending') : ?>bg-yellow-100 <?php elseif ($commentStatus === 'rejected') : ?> bg-red-100 <?php elseif ($commentStatus === 'approved') : ?> bg-emerald-100 <?php endif ?>">
                        <p class="whitespace-nowrap text-sm"><?= htmlspecialchars($commentStatus) ?></p> <!-- Escape blog status -->
                    </span>

                    <!-- Display buttons to approve or reject the comment depending on its status -->
                    
                </blockquote>
            <?php endwhile ?>

        </div>
    </div>
</section>

<?php
// Include the footer
include 'components/footer.php';
?>