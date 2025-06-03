<?php
include 'components/header.php';
include 'database/config.php';

$blog = $conn->prepare("SELECT
                       b.blog_id, b.user_id, b.blog_title, b.blog_content, b.blog_image, b.blog_status, b.created_at, u.username
                       FROM newblogs b
                       INNER JOIN users u ON b.user_id = u.user_id
                       WHERE blog_status ='Published' 
                       ORDER BY created_at
                       DESC LIMIT 3");
$blog->execute();
$blog->store_result();
$blog->bind_result($blog_id, $user_id, $title, $content, $image, $status, $created, $username);

?>

<!--<div class="grid md:grid-cols-3 gap-6 min-h-[164px] py-12 p-16 bg-gradient-to-r from-slate-800 from-50% to-slate-600 font-sans overflow-hidden"> -->
<div class="grid md:grid-cols-3 gap-6 min-h-[100px] py-6 p-8 bg-gradient-to-r from-slate-700 from-50% to-slate-600 font-sans overflow-hidden">
    <h2 class="text-3xl text-center font-extrabold text-yellow-500 inline-block relative after:absolute after:w-4/6 after:h-1 after:left-0 after:right-0 after:-bottom-4 after:mx-auto after:bg-slate-400 after:rounded-lg-full md:col-span-3">
        Welcome to The Theatre Company
    </h2>
</div>

          
      </div>
    </div>

    <div class="bg-slate-700 font-sans">
      <div class="max-w-6xl mx-auto p-4">
        <div class="text-center">
          <h3 class="text-3xl font-bold text-yellow-500 inline-block relative  after:w-4/6 after:h-1 after:left-0 after:right-0 after:-bottom-4 after:mx-auto after:bg-slate-400 after:rounded-lg-full">LATEST BLOGS</h3>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-16 max-lg:max-w-3xl max-md:max-w-md mx-auto">
        <?php while($blog->fetch()) : ?>  

        <!-- "Blog Posts" -->
  <div class="bg-white cursor-pointer rounded-lg overflow-hidden shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] relative group">  
       
    <?php 
    //   Format the date if $created_at is defined; otherwise, provide a fallback.
      if (isset($created) && !empty($created)) {
          $date = new DateTime($created);
          $formattedDate = $date->format("F j, Y, g:i A");
      } else {
          $formattedDate = 'Unknown Date';
      }
    ?>
    
    <img src="<?= ROOT_DIR?>assets/images/<?= $image ?>" alt="<?= $title ?>" class="w-full h-96 object-cover" />
    
    <div class="p-6 absolute bottom-0 left-0 right-0 bg-black opacity-85">
      <span class="text-sm block text-yellow-600 mb-2"><?= $formattedDate ?> | <?= $username ?></span>
      <h3 class="text-xl font-bold text-yellow-500"><?= $title ?></h3>
      <div class="h-0 overflow-hidden group-hover:h-16 group-hover:mt-2 transition-all duration-500">
        <a href="<?= ROOT_DIR ?>blog?bid=<?= $blog_id ?>" class="text-yellow-300 text-sm">Read More</a>
        <p class="text-white text-sm"><?= $content ?></p>
      </div>
    </div>
   
  </div>

  <?php endwhile ?>

          

        </div>
      </div>
    </div>


<?php
include 'components/footer.php';
?>