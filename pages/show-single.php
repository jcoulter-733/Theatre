<?php
include 'components/header.php';
include 'database/config.php';

# SELECT show_id, show_name, show_type, show_info, date_shown, date_added FROM shows
$id = $_GET['bid'];
$blog = $conn->prepare("SELECT
s.show_name,
s.show_type,
s.show_info,
s.date_shown,
s.date_added,
s.show_image
FROM shows s
WHERE s.show_id = $id
");

$blog->execute();
$blog->store_result();
$blog->bind_result($name, $type, $showInfo, $dateShown, $dateAdded, $showImage);
$blog->fetch();




    //   Format the date if $created_at is defined; otherwise, provide a fallback.
      if (isset($dateShown) && !empty($dateShown)) {
          $dateShown = new DateTime($dateShown);
          $formattedDate = $dateShown->format("F j, Y, g:i A");
      } else {
          $formattedDate = 'Unknown Date';
      }
?>

<section class="bg-white dark:bg-gray-900">
  <br />
  <div class="container rounded-xl px-4 py-4 mx-auto bg-yellow-800 bg-opacity-25 border-2 border-yellow-500">
    <h1 class="text-8xl font-semibold text-yellow-500 capitalize lg:text-8xl dark:text-yellow-500"><?= $name ?></h1>
    <div class="container sm mx-auto bg-black bg-opacity-0 border-1 border-yellow-200">
    
    
    </div>

    <div class="mt-8 lg:-mx-6 lg:flex lg:items-start">
      <img
        class=" border-4 border-red-500 object-cover w-full lg:mx-6 lg:w-1/2 rounded-xl h-72 lg:h-96"
        src="<?= ROOT_DIR ?>assets/images/<?= $showImage ?>"
        alt="<?= $name ?>"
      />

      <div class="mt-2 lg:w-1/2 lg:mt-0 lg:mx-6">
    <p class="mt-3 text-3xl font-bold text-white underline decoration-yellow-500 align-text-top">
        Show Time: <?= $formattedDate ?>
    </p>

        <p class="text-3xl text-yellow-100 py-4">
          <?= $showInfo ?>
        </p>
        <p style="margin-top:50px"class="text-2xl font-extrabold text-red-400 uppercase">Show Type: <?= $type ?></p>

        
      </div>
    </div>
  </div>
</section>




<?php
include 'components/footer.php';
?>