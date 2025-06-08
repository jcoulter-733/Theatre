<?php
// Include database configuration and header
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';

function resolveFeedback($feedbackId) {
    global $conn;
    $stmt = $conn->prepare("UPDATE feedback SET feedback_status = 'resolved', feedback_admin_id = ? WHERE feedback_id = ?");
    $stmt->bind_param("ii", $_SESSION['user_id'], $feedbackId);
    if ($stmt->execute()) {
        $_SESSION['status_message'] = "Feedback resolved successfully.";
    } else {
        $_SESSION['status_message'] = "Error resolving feedback.";
    }
    $stmt->close();
    header("Location: view-feedback");
    exit();
}
// Prepare the SQL query to fetch comments along with blog and user data
$comments = $conn->prepare("SELECT
f.feedback_id,
f.feedback_name,
f.feedback_email,
f.feedback_message,
f.feedback_status,
f.feedback_time_sent,
f.feedback_admin_id,
u.username
FROM feedback f
LEFT JOIN users u ON f.feedback_admin_id = u.user_id

ORDER BY 
    CASE 
        WHEN f.feedback_status = 'unresolved' THEN 1 
        WHEN f.feedback_status = 'resolved' THEN 2         
    END ");
$comments->execute(); // Execute the query
$comments->store_result(); // Store the result for later use
$comments->bind_result($feedbackId, $feedbackName, $feedbackEmail, $feedbackMessage, $feedbackStatus, $feedbackTimeSent, $feedbackAdminId, $username); // Bind the results to variables
?>
<section class="bg-slate-800">
    <div class="mx-auto max-w-screen-xl px-4 py-12 sm:px-6 lg:px-8 lg:py-16">
        <!-- Section heading -->
        <h2 class="text-center text-4xl font-bold tracking-tight text-yellow-500 sm:text-5xl">
            All Messages Received
        </h2>

        <div class="mt-8 grid grid-cols-1 gap-4 md:grid-cols-3 md:gap-8">
            <!-- Loop through each comment -->
            <?php while ($comments->fetch()) : ?>
                <blockquote class="rounded-lg bg-gray-50 p-6 shadow-xs sm:p-8">
                    <div class="flex items-center gap-4">

                        <div>
                            <!-- Display blog title -->
                            <p class="mt-0.5 text-lg font-medium text-gray-900">Sent by <?= htmlspecialchars($feedbackName) ?></p> <!-- Escape blog name -->
                            <p class="mt-0.5 text-lg font-medium text-gray-900">Sent at <?= htmlspecialchars($feedbackTimeSent) ?></p> <!-- Escape blog name -->
                            <p class="mt-0.5 text-lg font-medium text-gray-900">Reply to: <?= htmlspecialchars($feedbackEmail) ?></p> <!-- Escape blog name -->
                        </div>
                    </div>

                    <!-- Display the comment content -->
                    <p class="mt-4 text-gray-700">
                        <?= htmlspecialchars($feedbackMessage) ?> <!-- Escape comment content -->
                    </p>
                   

                    
                    <span class="inline-flex items-center justify-center rounded-full px-2.5 py-0.5 text-emerald-700 <?php if ($feedbackStatus === 'unresolved') : ?>bg-red-300 <?php elseif ($feedbackStatus === 'resolved') : ?> bg-emerald-100 <?php endif ?>">
                        <p class="whitespace-nowrap text-sm"><?= htmlspecialchars($feedbackStatus) ?></p> <!-- Escape blog status -->
                    </span>

                    <!-- Display buttons to approve or reject the comment depending on its status -->
                    <div>
                        <span class="inline-flex -space-x-px overflow-hidden rounded-md border bg-white shadow-xs">
                            <?php if($feedbackStatus === 'unresolved') : ?>
                            <!-- Approve and Reject buttons for 'pending' status -->
                             <!-- Use urlencode to escape comment ID in URL -->
                            <button  onclick="window.location.href='resolve-feedback?fid=<?= urlencode($feedbackId) ?>'" 
                                class="inline-block px-4 py-2 text-sm font-medium text-gray-700 hover:bg-gray-50 focus:relative">
                                Resolve
                            </button>

                            <?php elseif($feedbackStatus === 'resolved') : ?>
                            <!-- Display the username of the admin who resolved the feedback -->
                            <p class="mt-0.5 text-lg font-semibold text-red-500">Resolved by <?= htmlspecialchars($username) ?></p> <!-- Escape blog name -->
                            </button>
                            
                            <?php endif ?>
                        </span>
                    </div>
                </blockquote>
            <?php endwhile ?>

        </div>
    </div>
</section>



<?php
// Include the footer
include 'components/footer.php';
?>