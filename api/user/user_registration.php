<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$first_name = '';
$last_name = '';
$email_address = '';
$mobile_number = '';
$userid = '';
$pass = '';

$data = json_decode(file_get_contents("php://input"));

$first_name = $data->first_name;
$last_name = $data->last_name;
$email_address = $data->email_address;
$mobile_number = $data->mobile_number;
$userid = $data->userid;
$pass = $data->password;


{
	include('./../../config/connection.php');
$query = "insert into users (first_name,last_name,userid,password,email,mobile) VALUES ('$first_name','$last_name','$userid','$password','$email','$mobile')";
	$data = mysqli_query($connection,$query);
	$total = mysqli_num_rows($data);
	if($total == 1){
		$_SESSION['un'] = $user;
		$resp = array('resCode' => 'Ok', 'Message' => 'User validation successful') ;
		echo json_encode($resp);
	}else{
		$resp = array('resCode' => 'Error', 'Message' => 'Sorry, User not validate') ;
		echo json_encode($resp);
	}
} 
{
	$required = "";
	if(( empty ( $userid ) ) || ($userid = "")) {
		$required .= 'userid';
	}
	if(( empty ( $pass ) ) || ($userid = "")) {
		if($required != "")$required .= " and ";
		$required .= 'password';
	}
	echo $required;
	$resp = array('resCode' => 'Error', 'Message' => $required ." is required.") ;
	echo json_encode($resp);
}
?>