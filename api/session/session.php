<?php 
function checkActiveSession(){
	session_start();
	$_SESSION['user_id'] = $userid;
	$_SESSION['session_start_time'] = time();
	echo $_SESSION['user_id'];
	echo $_SESSION['session_start_time'];
 //  	if (!isset($_SESSION["user_id"]) || !$_SESSION["session_start_time"] || $_SESSION["session_start_time"]>300) {
	// 	$resp = array('resCode' => 'Error', 'message' => "Sorry, Session has expired.");
	// 	return json_encode($resp);
	// }else{
	// 	$resp = array('resCode' => 'Ok', 'message' => $_SESSION['user_id'].' have valid session') ;
	// 	return json_encode($resp);
	// }
}
?>