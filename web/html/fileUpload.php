<?php
error_reporting(0);
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Aerotic - File Upload</title>

  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
  <link href="../css/sb-admin-2.min.css" rel="stylesheet" type="text/css">

  <!-- Bootstrap core JavaScript-->
  <script type="text/javascript" src="../vendor/jquery/jquery.min.js"></script>
  <script type="text/javascript" src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script type="text/javascript" src="../vendor/notify/notify.js"></script>
  <script type="text/javascript" src="../js/plugins/ajaxHendler.js"></script>
  <script type="text/javascript" src="../js/plugins/util.js"></script>

</head>

<body id="page-top">
	<div style="text-align: center;">
	  <h2 class="title">File Upload</h2>
	</div>
	<div class="body" style="margin:20px auto;padding: 30px">
	  <button class="btn btn-secondary" type="button" onclick="closePage();">Close</button><br/><br/>
		<form action="" method="post" enctype="multipart/form-data">
			<input class='primary' type="file" name="uploadfile" value=""/>
			<input type="submit" class="btn btn-primary" name="submit" value="Upload File"/>
		</form>
		<?php
		$filename = '';
		$filename = $_FILES["uploadfile"]["name"];
		if (isset($_GET['type']) && $_GET['type'] === 'profile') {
			$folder = "../profilePic/".$filename;
		} else {
			$folder = "../uploads/".$filename;
		}
		if($filename != ""){
		 $tempfilename = $_FILES["uploadfile"]['tmp_name'];
			move_uploaded_file($tempfilename,$folder);
			if (isset($_GET['type'])) {
			  if($_GET['type'] === "profile"){
			  	if(strpos($filename,'png') == true || strpos($filename,'jpg') == true || strpos($filename,'jpeg') == true){
			  		echo "<br/><br/><img src='$folder' height='200'  width='200' />";
			  		echo "<script> updateProfilePicName('$filename'); </script>";	
			  	} else {
			  		if($filename !== '')
			  		echo "<script> $.notify('Please upload image file only and we are support .png, .jpg or .jepg extention only!','error'); </script>";
			  	}
			  } else {

			  }
			} else {
				// echo "<script> alert(); </script>";
				echo "<script> $.notify('Type should be defined','error'); </script>";
			}
		}
		?>
	</div>
</body>
</html>