<?php
include 'components/header.php';
include 'database/config.php';
?>

<div class="font-[sans-serif] max-sm:px-4">
  <div class="min-h-screen flex flex-col items-center justify-center">
    <div class="grid md:grid-cols-2 items-center gap-4 max-md:gap-8 max-w-6xl max-md:max-w-lg w-full p-4 m-4 shadow-[0_2px_10px_-3px_rgba(6,81,237,0.3)] rounded-md">
      <div class="md:max-w-md w-full px-4 py-4">
        <!-- Use POST and point to the login controller -->
        <form method="POST" action="loginController">
        <?php if (isset($_SESSION['status_message'])): ?>
   <div class="mb-4 text-red-600 text-sm">
    <?= htmlspecialchars($_SESSION['status_message']) ?>
    <?php unset($_SESSION['status_message']); ?>
  </div>
<?php endif; ?>

          <div class="mb-12">
            <h3 class="text-gray-800 text-3xl font-extrabold">Sign in</h3>
            <p class="text-sm mt-4 text-gray-800">
              Don't have an account 
              <a href='register' class="text-blue-600 font-semibold hover:underline ml-1 whitespace-nowrap">Register here</a>
            </p>
          </div>

          <div>
            <label class="text-gray-800 text-xs block mb-2">Username</label>
            <div class="relative flex items-center">
              <input name="username" type="text" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-blue-600 pl-2 pr-8 py-3 outline-none" placeholder="Enter Username" />
              
              <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-2" viewBox="0 0 682.667 682.667">
                
              </svg>
            </div>
          </div>

          <div class="mt-8">
            <label class="text-gray-800 text-xs block mb-2">Password</label>
            <div class="relative flex items-center">
              <input name="password" type="password" required class="w-full text-gray-800 text-sm border-b border-gray-300 focus:border-blue-600 pl-2 pr-8 py-3 outline-none" placeholder="Enter password" />
              <svg xmlns="http://www.w3.org/2000/svg" fill="#bbb" stroke="#bbb" class="w-[18px] h-[18px] absolute right-2 cursor-pointer" viewBox="0 0 128 128">
                
              </svg>
            </div>
          </div>

          <div class="flex flex-wrap items-center justify-between gap-4 mt-6">
            <div class="flex items-center">
              <input id="remember-me" name="remember-me" type="checkbox" class="h-4 w-4 shrink-0 text-blue-600 focus:ring-blue-500 border-gray-300 rounded" />
              <label for="remember-me" class="ml-3 block text-sm text-gray-800">
                Remember me
              </label>
            </div>
            <div>
              
              <a href="javascript:void(0);" class="text-blue-600 font-semibold text-sm hover:underline">
                Forgot Password?
              </a>
            </div>
          </div>

          <div class="mt-12">
            <!-- Sign in button -->
            <button type="submit" class="w-full shadow-xl py-2.5 px-4 text-sm tracking-wide rounded-md text-white bg-blue-600 hover:bg-blue-700 focus:outline-none">
              Sign in
            </button>
          </div>

         
        </form>
      </div>

      <div class="w-full h-full flex items-center bg-[#000842] rounded-xl p-8">
        <img src="https://readymadeui.com/signin-image.webp" class="w-full aspect-[12/12] object-contain" alt="login-image" />
      </div>
    </div>
  </div>
</div>

<?php
include 'components/footer.php';
?>
