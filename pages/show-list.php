<?php
include 'components/header.php';
include 'database/config.php';
$blog = $conn->prepare("SELECT show_id, show_name, show_type, show_image, date_shown, date_added FROM shows ORDER BY date_shown ASC");
$blog->execute();
$blog->store_result();
$blog->bind_result($id, $name, $type, $image, $date_shown, $date_added);

?>
   


    <div class="bg-slate-700 font-sans">
      <div class="max-w-6xl mx-auto p-4">
        
        <div class="container rounded-xl px-14 py-4 mx-auto bg-yellow-800 bg-opacity-25 border-2 border-yellow-500 text-center">
        <div class="text-center">
          <h3 class="text-3xl font-bold text-white inline-block relative  after:w-4/6 after:h-1 after:left-0 after:right-0 after:-bottom-4 after:mx-auto after:bg-slate-400 after:rounded-lg-full">LATEST SHOWS</h3>

        </div>
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6 mt-16 max-lg:max-w-3xl max-md:max-w-md mx-auto">
        <?php while($blog->fetch()) : ?>  

        <!-- "Blog Posts" -->
        
         
  <div class="bg-white cursor-pointer rounded-lg overflow-hidden shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] relative group">  
       
    <?php 
    //   Format the date if $created_at is defined; otherwise, provide a fallback.
      if (isset($date_shown) && !empty($date_shown)) {
          $date_shown = new DateTime($date_shown);
          $formattedDateShown = $date_shown->format("F j, Y, g:i A");
      } else {
          $formattedDateShown = 'Unknown Date';
      }
 
    $fileType = '.jpeg';
    $formattedName = str_replace(' ', '_', $name);
    $imageFolder = 'assets/images/';
    $imageLink = $imageFolder . $formattedName . $fileType;
    ?>
  
  <a href="show?bid=<?= $id ?> ">
    <img src="<?= ROOT_DIR?><?= $imageLink ?>" alt="<?= $name ?>" class="w-full h-96 object-cover" />
  </a>
    
    <div class= "p-6 absolute bottom-0 left-0 right-0 bg-black opacity-75 border-2 border-white">
    
      <span class="text-sm block text-white mb-2"><?= $formattedDateShown ?> | BY AUTHOR</span>
      <h3 class="text-xl font-bold text-white"><?= $name ?></h3>

      <div class="h-0 overflow-hidden group-hover:h-16 group-hover:mt-4 transition-all duration-600">
        <a href="show?bid=<?= $id ?>" class="text-white text-sm">Read More</a>
        <p class="text-white text-sm"><?= $type ?></p>
      </div>

    </div>
   
  </div>

  <?php endwhile ?>

          

        </div>
      </div>
    </div>


<?php
include 'components/footer.php';