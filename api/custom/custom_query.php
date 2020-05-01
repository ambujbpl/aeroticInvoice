<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$query = '';

$data = json_decode(file_get_contents("php://input"));
$query = $data->query;
$ui_token = $data->token;
if($query && $ui_token)
{
	include('./../config/connection.php');
	include('./../session/token.php');
	include('./../session/session.php');
	$token = tokenValidation($ui_token);
	if($token){
		$session = checkActiveSession();
		if($session){
			$data = mysqli_query($connection,$query);
			$total = mysqli_num_rows($data);
			mysqli_close($connection);
			if($total >= 1 || $data){
				$data_array = array();
				if($total >= 1){		
					while($row = $data->fetch_assoc()){
						$data_array[] = $row;
					}	
				}
				mysqli_free_result($data);
				$resp = array('resCode' => 'Ok', 'message' => 'Query execute successfully', 'data' => $data_array) ;
				echo json_encode($resp);
			}else{
				$resp = array('resCode' => 'Error', 'message' => "Sorry, Something went wrong.") ;
				echo json_encode($resp);
			}
		}else{
			$resp = array('resCode' => 'SessionError', 'message' => "Sorry your session has been expired.") ;
			echo json_encode($resp);
		}
	} else {
		$resp = array('resCode' => 'TokenError', 'message' => "Invalid Token.") ;
		echo json_encode($resp);
	}

}else{
	if(!$ui_token) $resp = array('resCode' => 'SessionError', 'message' => "Token is required.");
	else if(!$query) $resp = array('resCode' => 'Error', 'message' => "Query is required.");
	echo json_encode($resp);
}
?>