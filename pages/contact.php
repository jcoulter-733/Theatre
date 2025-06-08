<?php


include 'components/header.php';
include 'database/config.php';

// fetch user if logged in
$username = '';
$email    = '';
if (!empty($_SESSION['id'])) {
    $user_id = $_SESSION['id'];
    $stmt = $conn->prepare(
      "SELECT username, email 
         FROM users 
        WHERE user_id = ?"
    );
    $stmt->bind_param("i", $user_id);
    $stmt->execute();
    $stmt->bind_result($username, $email);
    $stmt->fetch();
    $stmt->close();
}
?>

<h1 class="flex justify-center text-lg font-bold mt-4">Contact us</h1>

<form
  class="space-y-4 font-[sans-serif] max-w-md mx-auto mt-4 mb-4"
  action="contact-us"
  method="post"
  enctype="multipart/form-data"
>
  <p>Enter your details below</p>

  <?php if (!empty($username)): ?>
    <!-- user is logged in -->
    <label for="name"  class="block text-yellow-500">Name</label>
    <input
      type="text"
      id="name"
      name="name"
      value="<?= htmlspecialchars($username, ENT_QUOTES) ?>"
      readonly required
      class="px-4 py-3 bg-gray-900 w-full text-sm outline-grey-600"
    />

    <label for="email" class="block text-yellow-500">Email</label>
    <input
      type="email"
      id="email"
      name="email"
      value="<?= htmlspecialchars($email, ENT_QUOTES) ?>"
      readonly required
      class="px-4 py-3 bg-gray-900 w-full text-sm outline-grey-600"
    />
  <?php else: ?>
    <!-- guest user -->
    <label for="name"  class="block text-yellow-500">Name</label>
    <input
      type="text"
      id="name"
      name="name"
      value=""
      class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"
    />

    <label for="email" class="block text-yellow-500">Email</label>
    <input
      type="email"
      id="email"
      name="email"
      value=""
        required
      class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"
    />
  <?php endif; ?>

  <label for="message" class="block text-yellow-500">Message</label>
  <textarea
    id="message"
    name="message"
    class="px-4 py-3 bg-gray-600 w-full text-sm outline-none border-b-2 border-blue-500 rounded"
    rows="5"
    required
    placeholder="Enter your message here"
  ></textarea>

  <button
    type="submit"
    class="!mt-8 w-full px-4 py-2.5 mx-auto block text-sm bg-blue-500 text-white rounded hover:bg-blue-600"
  >
    Send Message
  </button>
</form>
<?php if(isset($_SESSION['statusMsg'])) : ?>
        <h4 class="text-center text-green-500 font-semibold"><?= $_SESSION['statusMsg'] ?></h4>
    <?php endif ?>

<?php include 'components/footer.php'; ?>
