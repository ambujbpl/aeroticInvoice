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
if($userid)
{
	include('./../config/connection.php');
	$query = "select * from users where userid='$userid'";
	$data = mysqli_query($connection,$query);
	$total = mysqli_num_rows($data);
	mysqli_close($connection);
	if($total >= 1){
		$data_array = array();
		while($row = $data->fetch_assoc()){
			$data_array[] = $row;
		}
		mysqli_free_result($data);
		$resp = array('resCode' => 'Ok', 'message' => 'User details fetch successful', 'data' => $data_array ) ;
		echo json_encode($resp);
	}else{
		$resp = array('resCode' => 'Error', 'message' => "Sorry, We not found any user for userid :- '$userid'") ;
		echo json_encode($resp);
	}
}else{	
	$resp = array('resCode' => 'Error', 'message' => "userid is required.") ;
	echo json_encode($resp);
}
?>