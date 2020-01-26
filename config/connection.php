<?php
include 'config.php';
error_reporting(0);
$connection = mysqli_connect($host,$username,$password,$database,$port);
if($connection)
{
	// echo "Connection Establishment Successfully!";	
}
else{
	die("Connection failed Error! because ".mysqli_connect_error());
}
?>
