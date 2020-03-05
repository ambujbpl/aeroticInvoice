<?php
function sendEmail($to,$subject,$txt){
	// $to = "somebody@example.com";
	// $subject = "My subject";
	// $txt = "Hello world!";
	// echo $txt;
	$headers = "From: ambujdubey89@gmail.com" . "\r\n" .
	"CC: ambuj.ideata@gamil.com";
	if(mail($to,$subject,$txt,$headers)){
		return "mail send successfully";
	} else {
		return "something went wrong";
	}
}	
?>