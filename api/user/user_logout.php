<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$userid = '';

$data = json_decode(file_get_contents("php://input"));

$userid = $data->userid;

if($userid){
	include('./../custom/custom_query_function.php');
	$userRecord = runCustomQuery("select * from users where userid='$userid'");
	$userRecordDecode = json_decode($userRecord, true);
	$userRecordDecodeDataID = $userRecordDecode['data'][0]['id'];
	runCustomQuery("insert into logs (type,info,table_name,map_id) values ('logout','$userid','users',$userRecordDecodeDataID)");
	session_start();
	session_unset();
	session_destroy();
	$resp = array('resCode' => 'Ok', 'message' => "User logout successfully.");
	echo json_encode($resp);
} else {
	$resp = array('resCode' => 'Error', 'message' => "User ID is required.");
	echo json_encode($resp);
}

?>