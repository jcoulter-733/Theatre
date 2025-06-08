<?php
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
?>



<?php
include 'components/footer.php';
?>