<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$userid = '';
$pass = '';

$data = json_decode(file_get_contents("php://input"));

$userid = $data->userid;
$pass = $data->password;

if($userid && $pass)
{
	include('./../config/connection.php');
	$query = "select * from users where userid='$userid' && password='$pass'";
	$data = mysqli_query($connection,$query);
	$total = mysqli_num_rows($data);
	mysqli_free_result($data);
	mysqli_close($connection);
	if($total == 1){
		session_start();
		$_SESSION['user_id'] = $userid;
		$resp = array('resCode' => 'Ok', 'message' => 'User validation successful', 'userid' =>  $userid) ;
		echo json_encode($resp);
	}else{
		$resp = array('resCode' => 'Error', 'message' => 'Sorry, User not validate');
		echo json_encode($resp);
	}
}else{
	$required = "";
	if(( empty ( $userid ) ) || ($userid = "")) {
		$required .= 'userid';
	}
	if(( empty ( $pass ) ) || ($userid = "")) {
		if($required != "")$required .= " and ";
		$required .= 'password';
	}
	$resp = array('resCode' => 'Error', 'message' => $required ." is required.");
	echo json_encode($resp);
}
?>