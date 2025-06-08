<?php
require_once 'auth.php';
requireRole('admin');        // ← only admins allowed beyond this line
include 'components/header.php';
include 'database/config.php';
?>
<form class="space-y-4 font-[sans-serif] max-w-md mx-auto">
      <input type="email" placeholder="Enter Email"
        class="px-4 py-3 bg-gray-100 w-full text-sm outline-none border-b-2 border-blue-500 rounded" />

      <input type="password" placeholder="Enter Password"
        class="px-4 py-3 bg-gray-100 w-full text-sm outline-none border-b-2 border-transparent focus:border-blue-500 rounded" />

      <div class="flex">
        <input type="checkbox" class="w-4" />
        <label class="text-sm ml-4 ">Remember me</label>
      </div>

      <button type="button"
        class="!mt-8 w-full px-4 py-2.5 mx-auto block text-sm bg-blue-500 text-white rounded hover:bg-blue-600">Submit</button>
    </form>