<?php
include 'components/header.php';
include 'database/config.php';
$blog = $conn->prepare("SELECT 
                        b.blog_id, b.user_id, b.blog_title, b.blog_content, b.blog_image, b.blog_status, b.created_at, u.username
                       FROM newblogs b
                       INNER JOIN users u ON b.user_id = u.user_id
                       WHERE blog_status ='Published' 
                       ORDER BY created_at DESC");
$blog->execute();
$blog->store_result();
$blog->bind_result($blog_id, $user_id, $title, $content, $image, $status, $created, $username);

?>
           

    <div class="container rounded-xl mt-4 mb-4 px-14 py-4 mx-auto bg-yellow-800 bg-opacity-25 border-2 border-yellow-500 text-center">
      <div class="max-w-6xl mx-auto p-4">
        <div class="text-center">
          <h3 class="text-3xl font-bold text-yellow-500 inline-block relative  after:w-4/6 after:h-1 after:left-0 after:right-0 after:-bottom-4 after:mx-auto after:bg-slate-400 after:rounded-lg-full">LATEST BLOGS</h3>
        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-16 max-lg:max-w-3xl max-md:max-w-md mx-auto">
          
        <?php while($blog->fetch()) : ?>  

        <!-- "Blog Posts" -->
  <div class="bg-grey-200 cursor-pointer rounded-lg overflow-hidden shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] relative group">  
       
    <?php 
    //   Format the date if $created_at is defined; otherwise, provide a fallback.
      if (isset($created) && !empty($created)) {
          $created = new DateTime($created);
          $formattedDateShown = $created->format("F j, Y, g:i A");
      } else {
          $formattedDateShown = 'Unknown Date';
      }
      
  
    
    ?>
    
    <img src="<?= ROOT_DIR?>assets/images/<?= $image ?>" alt="<?= $title ?>" class="w-full h-96 object-cover" />
    
    <div class= "p-6 absolute bottom-0 left-0 right-0 bg-black opacity-75 border-2 border-white">
      <span class="text-sm block text-white mb-2"><?= $formattedDateShown ?> | BY <?= $username ?></span>
      <h3 class="text-xl font-bold text-white"><?= $title ?></h3>
      <div class="h-0 overflow-hidden group-hover:h-16 group-hover:mt-4 transition-all duration-600">
        <a href="blog?bid=<?= $blog_id ?>" class="text-white text-sm">Read More</a>
        <p class="text-white text-sm"><?= $content ?></p>
      </div>

    </div>
   
  </div>
  
  <!-- End of Blog Post -->

  <?php endwhile ?>

          

        </div>
      </div>
    </div>


<?php
include 'components/footer.php';
?>