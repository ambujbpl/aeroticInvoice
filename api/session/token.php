<?php 
function tokenValidation($ui_token){
	session_start();
	if($ui_token == $_SESSION['token']){
		return true;
	} else {
		return false;
	}
}
?>