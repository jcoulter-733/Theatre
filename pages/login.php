<?php
include 'components/header.php';
include 'database/config.php';
?>

<div class="font-[sans-serif]">
  <!-- container for max-width + centering -->
  <div class="container mx-auto mb-4 px-4 pt-6">
    <!-- grid for 2-column layout -->
    <div class="grid md:grid-cols-2 items-center gap-8 bg-slate-900 shadow-lg rounded-lg p-6">
      
      <!-- LEFT: sign-in form -->
      <div>
        <form method="POST" action="loginController">
          <?php if (isset($_SESSION['status_message'])): ?>
            <div class="mb-4 text-red-600 text-sm">
              <?= htmlspecialchars($_SESSION['status_message']) ?>
              <?php unset($_SESSION['status_message']); ?>
            </div>
          <?php endif; ?>

          <div class="mb-6">
            <h3 class="text-yellow-500 text-3xl font-extrabold">Sign in</h3>
            <p class="text-sm mt-4 text-yellow-500">
              Don't have an account?
              <a href="register" class="font-semibold hover:underline">Register Here</a>
            </p>
          </div>

          <div class="mb-6">
            <label class="text-yellow-500 text-xs block mb-2">Username</label>
            <input
              name="username"
              type="text"
              required
              class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-blue-600 pl-2 py-3 outline-none"
              placeholder="Enter Username"
            />
          </div>

          <div class="mb-6">
            <label class="text-yellow-500 text-xs block mb-2">Password</label>
            <input
              name="password"
              type="password"
              required
              class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-blue-600 pl-2 py-3 outline-none"
              placeholder="Enter Password"
            />
          </div>

          <div class="flex items-center justify-between mb-4">
            <label class="inline-flex items-center">
              
            </label>
            
          </div>

          <button
            type="submit"
            class="w-full py-2.5 text-sm font-medium text-white bg-blue-600 rounded-md shadow hover:bg-blue-700 focus:outline-none"
          >
            Sign in
          </button>

          <a href="feedback" class="flex justify-center mt-2 text-blue-600 font-semibold text-sm hover:underline">
              Forgot Password?
            </a>
        </form>
      </div>

      <!-- RIGHT: illustrative image -->
      <div class="flex justify-center">
        <img
          src="assets/images/clyde_theatre_tp.png"
          alt="Logo"
          class="w-1/3 h-auto object-contain rounded-md"
        />
      </div>
    </div>
  </div>
</div>

<?php include 'components/footer.php'; ?>
