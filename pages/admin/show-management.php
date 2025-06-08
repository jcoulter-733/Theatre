<?php
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';

$comments = $conn->prepare("SELECT
show_id,
show_name,
show_info,
show_type,
date_shown
FROM shows
ORDER BY date_shown ASC
");
$comments->execute(); // Execute the query
$comments->store_result(); // Store the result for later use
$comments->bind_result($showId, $showName, $showInfo, $showType, $dateShown); // Bind the results to variables
?>

<div class="overflow-x-auto flex justify-center">
  <table class="text-center mt-10 mb-10 min-w-full divide-y-2 divide-gray-200 bg-white text-sm">
    <thead>
      <tr>
        <th class="px-4 py-2 font-medium whitespace-nowrap text-gray-900 align-left">Name</th>
        <th class="px-4 py-2 font-medium whitespace-nowrap text-gray-900">Type</th>
        <th class="px-4 py-2 font-medium whitespace-nowrap text-gray-900">Date Shown</th>
        <th class="px-4 py-2 font-medium whitespace-nowrap text-gray-900">Actions</th>

      </tr>
    </thead>
    <tbody class="divide-y divide-gray-200">
    <?php while($comments->fetch()) : ?>
      <tr>
        <td class="px-4 py-2 font-medium whitespace-nowrap text-gray-900"> <?= htmlspecialchars($showName) ?></td>
        <td class="px-4 py-2 whitespace-nowrap text-gray-700"><?= htmlspecialchars($showType) ?></td>
        <td class="px-4 py-2 whitespace-nowrap text-gray-700"><?= htmlspecialchars($dateShown) ?></td>
        <td class="px-4 py-2 whitespace-nowrap">
          <a
            href="edit-show?sid=<?=$showId?>"
            class="inline-block rounded-sm bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
          >
            Edit
          </a>
          <a
            href="delete-show?sid=<?=$showId?>"
            
            class="inline-block rounded-sm bg-indigo-600 px-4 py-2 text-xs font-medium text-white hover:bg-indigo-700"
          >
            Delete
          </a>
        

        </td>
      </tr>
      <?php endwhile ?>
    </tbody>
  </table>
</div>
<?php
include 'components/footer.php';
?>