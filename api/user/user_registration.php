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
include('./../config/connection.php');
$query1 = "select * from users where userid='$userid'";
$data1 = mysqli_query($connection,$query1);
$total1 = mysqli_num_rows($data1);
// mysqli_free_result($data1);
// mysqli_close($connection);	
if($total1 == 1){
	$resp = array('resCode' => 'Error', 'Message' => "Sorry, User ID:- $userid already registered") ;
	echo json_encode($resp);
}else{
	$query2 = "insert into users (first_name,last_name,userid,password,email,mobile) VALUES ('$first_name','$last_name','$userid','$pass','$email_address','$mobile_number')";
	// $data2 = mysqli_query($connection,$query2);
	if ($connection->query($query2) === TRUE) {
		$connection->close();
	  $resp = array('resCode' => 'Ok', 'Message' => 'User registered successful') ;
		echo json_encode($resp);
	} else {
	  $resp = array('resCode' => 'Error', 'Message' => 'Sorry, User registration failed') ;
		echo json_encode($resp);
	}
}
?>