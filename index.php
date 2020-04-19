<?php
  session_start();
  // echo $_SESSION["user_id"];
  // echo $_SESSION["session_start_time"];

$now = new DateTime();
echo $now->format('Y-m-d H:i:s') . '<br>';    // MySQL datetime format
echo $now->getTimestamp() . '<br>'; 

$d=strtotime("now");
	$time = date();//("h:i:sa")
	echo date("Y-m-d h:i:sa", $d) . '<br>';
	$startTime = date("H:i", strtotime('-30 minutes', $time));
	echo $startTime . '<br>';
	$endTime = date("H:i", strtotime('+30 minutes', $time));
  echo $endTime . '<br>';
  // if (!isset($_SESSION["user_id"]) || !$_SESSION["session_start_time"] || $_SESSION["session_start_time"]>300) {
  // 	// echo "<script> localStorage.clear(); </script>";
  //   header("Location: web/login.html");
  // }else{
  //   header("Location: web/dashboard.html");
  // }
?>