<?php
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
// if(!isset($_SESSION['loggedin'])){
//     header('Location: login');
// }
?>

<main class="upload container mx-auto p-6">
	<h1 class="text-2xl font-bold text-center mb-6"></h1>
    <?php if(isset($_SESSION['statusMsg'])) : ?>
        <h4 class="text-center text-green-500 font-semibold"><?= $_SESSION['statusMsg'] ?></h4>
    <?php endif ?>
<h2 class="header text-xl font-semibold text-yellow-500 text-center"> Add a new show </h2>
<section class="uploadVinyl bg-white shadow-md rounded-lg p-6 mt-4">
    <form action="<?= ROOT_DIR ?>create-show-config" method="post" enctype="multipart/form-data" class="space-y-4">
        <label for="imgUpload" class="block text-gray-600 mb-1">Select Show Image</label>
        <input type="file" name="image_url" id="image_url" class="block w-full border rounded p-2">
       
        <label for="blogTitle" class="block text-gray-600">Show Name</label>    
        <input type="text" name="name" id="title" required class="block w-full border rounded p-2">
       
        <label for="blogContent" class="block text-gray-600">Show Info</label>    
        <textarea name="info" id="content" class="block w-full border rounded p-2"></textarea>

        <label for="showType" class="block text-gray-600">Show Type</label>    
        <textarea name="showType" id="type" class="block w-full border rounded p-2"></textarea>

        <label for="date" class="block text-gray-600">Show Date</label>
        <input type="datetime-local" name="date" id="date" required class="block w-full border rounded p-2">
       

        <input type="submit" name="submit" value="Upload" class="bg-blue-500 text-white font-bold py-2 px-4 rounded cursor-pointer hover:bg-blue-600">
    </form>
</section>
</main>


<?php
include 'components/footer.php';
?>