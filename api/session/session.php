<?php 
function checkActiveSession(){
	session_start();
	if(isset($_SESSION["user_id"])) {
		$sessionExpireCheck = isLoginSessionExpired();
		if($sessionExpireCheck) {
			return true;
		} else {
			return false;
		}
	}else{
		return false;
	}
}
function isLoginSessionExpired() {
	session_start();
	include('./../../common.php');
	if(isset($_SESSION['session_start_time'])) {
		if(((time() - $_SESSION['session_start_time']) < $sessionMaxTime)){ 
			return true; 
		} 
	}
	return false;
}

// Basic code for check session
// include('./../session/session.php');
// $session = checkActiveSession($ui_token);
// echo $session;
// if($session){

// }else{

// }
?>