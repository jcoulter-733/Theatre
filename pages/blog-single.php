<?php
include 'components/header.php';
$blog = $conn->prepare("SELECT blog_id, title, image, content, status FROM blogs WHERE status = 'published'");
$blog->execute();
$blog->store_result();
$blog->bind_result($id, $title, $image_url, $content, $status);
?>

<style>
  
</style>
  
<div class="bg-slate-600 sm:px-6 px-4 py-10 font-sans">
  <div class="max-w-xl mx-auto">
    <div>
      <h2 class="text-3xl font-extrabold text-gray-800 inline-block">Browse All Blogs</h2>
      <p class="text-gray-400 text-sm mt-4">Below Title Text</p>
    </div>

    <hr class="my-8" />

    <div class="grid gap-16">
      <?php while($blog->fetch()): ?>
        <div class="cursor-pointer rounded overflow-hidden group">
          <img src="<?= ROOT_DIR ?>assets/images/<?= $image_url ?>" alt="Blog image" class="w-full h-96 object-cover" />
          <h3 class="text-xl font-bold text-gray-800 hover:text-blue-500"><?= $title ?></h3>
          <div class="mt-4">
            <p class="text-gray-400 text-sm">Blog Content</p>
            <hr class="my-8" />
          </div>
        </div>
      <?php endwhile; ?>
    </div>

  </div>
</div>




<?php
include 'components/footer.php';
?>