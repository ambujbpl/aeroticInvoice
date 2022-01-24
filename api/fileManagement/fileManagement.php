<?php
	header("Access-Control-Allow-Origin: * ");
	header("Content-Type: application/json; charset=UTF-8");
	header("Access-Control-Allow-Methods: GET");
	header("Access-Control-Max-Age: 3600");
	header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
  $user_name = $_POST['user_name'];
	date_default_timezone_set('Asia/Kolkata');
	$timestamp = date("Y-m-d H:i:s");
  include('./../custom/custom_query_function.php');
	$target_dir = "./../../web/uploads/";
	$target_file = $target_dir . basename($_FILES["file_ref"]["name"]);
	$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
  $path = 'uploads/' . $user_name . '/' . $imageFileType . '/' ;  
  $folder_path = $target_dir . $user_name . '/' . $imageFileType . '/';  
	if(!is_dir($folder_path)){
    // mkdir($folder_path);
    mkdir($folder_path,0777,TRUE);
  }
	$target_file1 = $folder_path . basename($_FILES["file_ref"]["name"]);
	$path = $path . $_FILES["file_ref"]["name"];
	$uploadOk = 1;
	$errorMessage = '';
	if(is_uploaded_file($_FILES["file_ref"]["tmp_name"])){
		$temp_file = $_FILES["file_ref"]["tmp_name"];

		// Check if file already exists
		if (file_exists($target_file1)) {
		  $errorMessage = "Sorry, file having name " . $_FILES["file_ref"]["name"] . " already exists on server.";
		  $uploadOk = 0;
		}

		// Check file size
		if ($_FILES["file_ref"]["size"] > 15728640) {
		  $errorMessage = "Sorry, your file size is more then 15MB.";
		  $uploadOk = 0;
		}

		// if validation passed
		if($uploadOk == 1){
			if(move_uploaded_file($temp_file, $target_file1)) {
				$resp = array('success' => true, 'resCode' => 'ok', 'message' => 'File uploaded successfully!', 'path' => $path, 'extension' => $imageFileType,'name' => $_FILES["file_ref"]["name"], 'size' => $_FILES["file_ref"]["size"]) ;
				echo json_encode($resp);
			} else {
				$resp = array('success' => false, 'resCode' => 'error', 'message' => 'Something went wrong!') ;
				echo json_encode($resp);
			}
		} else {
			$resp = array('success' => false, 'resCode' => 'error', 'message' => $errorMessage) ;
			echo json_encode($resp);
		}
	} else {
		$resp = array('success' => false, 'resCode' => 'error', 'message' => 'Sorry, file user_id user_name must be required!') ;
		echo json_encode($resp);
	}
?>