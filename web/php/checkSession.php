<?php
  session_start();
	if(isset($_SESSION["user_id"])) {
		include('./function.php');
		if(!isLoginSessionExpired()) {
			echo "<script> localStorage.clear(); </script>";
	    	header("Location: web/login.html");
		} else {
			header("Location: web/dashboard.html");
		}
	}else{
		echo "<script> localStorage.clear(); </script>";
	  header("Location: web/login.html");
	}
?>