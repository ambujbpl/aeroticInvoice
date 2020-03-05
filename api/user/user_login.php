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
	include('./../custom/custom_query_function.php');
	include('./../email/email.php');
	$query = "select * from users where userid='$userid' && password='$pass'";
	$data = mysqli_query($connection,$query);
	$total = mysqli_num_rows($data);
	mysqli_free_result($data);
	mysqli_close($connection);
	if($total == 1){
		session_start();
		$_SESSION['user_id'] = $userid;
		$userRecord = runCustomQuery("select * from users where userid='$userid'");
		$userRecordDecode = json_decode($userRecord, true);
		$userRecordDecodeDataID = $userRecordDecode['data'][0]['id'];
		$userRecordDecodeDataNotification = $userRecordDecode['data'][0]['notification'];
		// if($userRecordDecodeDataNotification == "1"){
		// 	$userRecordDecodeDataEmail = $userRecordDecode['data'][0]['email'];
		// 	$userRecordDecodeDataName = $userRecordDecode['data'][0]['first_name'];
  //           $email_message = "Following user has logged in to the system at ".$time."\n\n";
  //           $email_message .= "Name  : ".$userRecordDecodeDataName."\n\n";
  //           $email_message .= "Email  : ".$userRecordDecodeDataEmail."\n\n";
  //           $email_message .= "User ID: ".$userid."\n\n";
		// 	$sendEmail = sendEmail($userRecordDecodeDataEmail,"A user ($userRecordDecodeDataName) logged in to the system",$email_message);
		// 	echo $sendEmail; 
		// }
		runCustomQuery("insert into logs (type,info,table_name,map_id) values ('login','$userid','users',$userRecordDecodeDataID)");
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