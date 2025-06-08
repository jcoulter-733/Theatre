<?php 
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
$sid = isset($_GET['sid']) ? (int) $_GET['sid'] : 0;

    $user = $conn->prepare("SELECT
    s.show_id,
    s.show_name,
    s.show_type,
    s.show_image,
    s.date_shown,
    s.show_info
FROM shows s
where show_id = $sid
");
$user->execute();               // Execute the query
$user->store_result();          // Store the result
$user->bind_result($show_id, $show_name, $show_type, $show_image, $date_shown, $show_info);
$user->fetch();
?>
    <h1 class="flex justify-center text-2xl font-bold mt-4">Edit Show, <?= htmlspecialchars($show_name) ?></h1>
    <form class="space-y-4 font-[sans-serif] max-w-md mx-auto mt-4 mb-4" action="update-show?sid=<?= $sid ?>" method="post" enctype="multipart/form-data">
      <p>ID: <?= $sid ?></p>

      <label for="name" class="block text-yellow-500">Show Name</label>
      <input type="text" name="name" value="<?= $show_name ?>"
        class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded" />

        <label for="info" class="block text-yellow-500">Show Info</label>
        <textarea name="info" class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"><?= $show_info ?></textarea>

        <label for="type" class="block text-yellow-500">Show Type</label>
        <textarea name="type" class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"><?= $show_type ?></textarea>
        <label for="image">Show Image (current: <?= htmlspecialchars($show_image) ?>)</label>
  <input type="file" name="image" id="image">
  <input type="hidden" name="show_image" value="<?= htmlspecialchars($show_image) ?>">

        <label for="date" class="block text-yellow-500">Show Date</label>
        <input type="datetime-local" name="date" value="<?= $date_shown ?>" id="date" required class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded">

       

      <button type="submit"
        class="!mt-8 w-full px-4 py-2.5 mx-auto block text-sm bg-blue-500 text-white rounded hover:bg-blue-600">Submit</button>
    </form>

    
<?php include 'components/footer.php' ?>

