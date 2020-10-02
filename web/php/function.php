<?php
	// session_start();
	function isLoginSessionExpired() {
    if(isset($_SESSION['session_start_time'])) {
      if(((time() - $_SESSION['session_start_time']) < 20000)){ 
        return true; 
      } 
    }
    return false;
	}
?>