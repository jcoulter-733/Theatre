<?php
include 'components/header.php';
include 'database/config.php';

$blogId = $_GET['bid'];
$blog = $conn->prepare("SELECT 
                        b.user_id, b.blog_title, b.blog_content, b.blog_image, b.blog_status, b.created_at, u.username
                       FROM newblogs b
                       INNER JOIN users u ON b.user_id = u.user_id
                       WHERE blog_id = ?");
$blog->bind_param("i", $blogId);
$blog->execute();
$blog->store_result();
$blog->bind_result($authorId, $title, $content, $image, $status, $created, $username);
$blog->fetch();

// Fetch all comments for this blog
$blogComments = $conn->prepare("
    SELECT 
        c.comment_content, 
        c.comment_created, 
        u.username 
    FROM blog_comments c
    INNER JOIN users u ON c.user_id = u.user_id
    WHERE c.blog_id = ? AND c.comment_status = 'approved'
    ORDER BY c.comment_created DESC
");
$blogComments->bind_param("i", $blogId);
$blogComments->execute();
$blogComments->store_result();
$blogComments->bind_result($comment, $commentCreated, $username);
?>

<section class="bg-white dark:bg-gray-900">
    <div class="container px-6 py-10 mx-auto">
        <?php 
          if (isset($created) && !empty($created)) {
              $created = new DateTime($created);
              $formattedDateShown = $created->format("F j, Y, g:i A");
          } else {
              $formattedDateShown = 'Unknown Date';
          }
        ?>
        <h1 class="text-5xl font-semibold text-gray-800 capitalize lg:text-5xl dark:text-white"><?= $title ?></h1>
          
        <div class="mt-8 lg:-mx-6 lg:flex lg:items-center">
            <img class="object-cover w-full m:mx-4 lg:w-1/2 rounded-xl h-72 lg:h-96" src="<?= ROOT_DIR?>assets/images/<?= $image ?>" alt="<?= $title ?>" />

            <div class="mt-6 lg:w-1/2 lg:mt-0 lg:mx-6">
                <a href="#" class="block mt-4 text-5xl font-semibold text-gray-800 hover:underline dark:text-yellow-500 md:text-4xl">
                    <?= $title ?>
                    <div class="flex items-center space-x-2">
  <img
    class="object-cover object-center w-10 h-10 rounded-full"
    src="https://images.unsplash.com/photo-1531590878845-12627191e687?ixlib=rb-1.2.1&amp;ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&amp;auto=format&amp;fit=crop&amp;w=764&amp;q=80"
    alt=""
  >
  <h1 class="text-lg text-yellow-400 dark:text-gray-200">
    Posted on <?= $formattedDateShown ?> by <?= $username ?>
  </h1>
</div>
                </a>

                <p class="mt-3 text-3xl text-gray-500 dark:text-gray-200 md:text-sm">
                    <?= $content ?>
                </p>

                <div class="flex items-center mt-6">
                    

                    <div class="mx-4">
                        
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- comment form -->
    <?php if(isset($_SESSION['id'])) : ?>
        <div class="flex justify-center bg-slate-800 mt-20">
            <form id="commentForm" action="commentControllerSanitise?bid=<?= $blogId ?>&uid=<?= $_SESSION['id'] ?>" method="post" class="w-full max-w-lg mt-4 bg-slate-900 rounded-lg px-4 pt-2">
                <label for="comment" class="block mb-2 text-sm font-bold text-yellow-500">Comment on <?= $title ?></label>
                <textarea id="comment" name="content" rows="4" class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border border-gray-300 focus:ring-blue-500 focus:border-blue-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-blue-500 dark:focus:border-blue-500" placeholder="Type your comment"></textarea>
                <button
                    type="submit"
                    class="
                        block mx-auto mt-4                                                             
                        
                        px-4 py-2 
                        bg-yellow-500 text-white 
                        rounded-lg 
                        font-medium text-xl 
                        before:bg-yellow-500 before:absolute before:-bottom-1 
                        before:block before:h-[2px] before:w-full 
                        before:origin-bottom-right before:scale-x-0 
                        before:transition before:duration-500 before:ease-in-out 
                        hover:bg-yellow-700 
                        focus:outline-none
                    "
                >
                    Submit Comment
                </button>
                <p class="flex justify-center text-m text-yellow-500 mt-5">Your comment will appear once approved by admin</p>
            </form>
        </div>
    <?php else : ?>
        <p class="px-6 mt-20 text-center text-gray-600 dark:text-gray-300">Please sign in to comment on this blog</p>
    <?php endif ?>
</section>

<section class="bg-gray-100 dark:bg-gray-800 py-10">
    <div class="container px-6 mx-auto bg-slate-800">
        <h2 class="flex justify-center text-3xl font-semibold text-gray-800 dark:text-white mb-6">Comments</h2>

        <?php if ($blogComments->num_rows === 0): ?>
            <p class="text-yellow-500 dark:text-gray-300">No comments yet. Be the first to comment!</p>
        <?php else: ?>
            <?php while ($blogComments->fetch()): ?>
                <?php 
                  // Format each comment's date
                  if (!empty($commentCreated)) {
                      $dt = new DateTime($commentCreated);
                      $formattedCommentDate = $dt->format("F j, Y, g:i A");
                  } else {
                      $formattedCommentDate = 'Unknown Date';
                  }
                ?>
                <div class="bg-white dark:bg-gray-900 rounded-lg shadow mb-6 p-6">
                    <div class="flex items-start">
                        <img
                            src="https://icons.iconarchive.com/icons/diversity-avatars/avatars/256/charlie-chaplin-icon.png"
                            class="w-12 h-12 rounded-full border border-gray-300 dark:border-gray-700"
                            alt="Avatar"
                            loading="lazy"
                        >

                        <div class="ml-4 max-w-lg">
                            <div class="flex justify-between items-center">
                                <p class="text-lg font-semibold text-gray-800 dark:text-gray-200">
                                    Comment by <?= $username ?> <span class="text-sm text-gray-500 dark:text-gray-400">Posted on <?= $formattedCommentDate ?></span>
                                </p>
                              
                            </div>

                            <p class="mt-2 text-gray-600 dark:text-gray-300">
                                <?= htmlspecialchars($comment) ?>
                            </p>
                        </div>
                    </div>
                </div>
            <?php endwhile; ?>
        <?php endif; ?>
    </div>
</section>

<script>
document.getElementById('commentForm').addEventListener('submit', function(event) {
  const comment = document.getElementById('comment').value.trim();

  if (comment.length < 5) {
    alert('Comment must be at least 5 characters long.');
    event.preventDefault();
  }
  if (comment.length > 500) {
    alert('Comment cannot be longer than 500 characters.');
    event.preventDefault();
  }
});
</script>

<?php
include 'components/footer.php';
?>
