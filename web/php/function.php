<?php
	session_start();
	function isLoginSessionExpired() {
		include('./../../common.php');
		if(isset($_SESSION['session_start_time'])) {  
			if(((time() - $_SESSION['session_start_time']) < $sessionMaxTime)){ 
				return true; 
			} 
		}
		return false;
	}
?>