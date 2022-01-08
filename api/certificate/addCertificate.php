<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$ownername = '';
$mobile = '';
$address1 = '';
$technicianname = '';
$vehicle = '';
$engine = '';
$chassi = '';
$manufacturer = '';
$makerclassification = '';
$registrationdate = '';
$speed = '';
$installationdate = '';
$roto = '';
$invoiceno = '';

$data = json_decode(file_get_contents("php://input"));
$ownername = $data->ownername;
$mobile = $data->mobile;
$address = $data->address1;
$technicianname = $data->technicianname;
$vehicle = $data->vehicle;
$engine = $data->engine;
$chassi = $data->chassi;
$manufacturer = $data->manufacturer;
$makerclassification = $data->makerclassification;
$registrationdate = $data->registrationdate;
$speed = $data->speed;
$installationdate = $data->installationdate;
$roto = $data->roto;
$invoiceno = $data->invoiceno;


// echo $mobile;
include('./../config/connection.php');
// $query1 = "select * from users where vehicle='$vehicle'";
// $data1 = mysqli_query($connection,$query1);
// $total1 = mysqli_num_rows($data1);
// mysqli_free_result($data1
// mysqli_close($connection); 
// if($total1 == 1){
//   $resp = array('resCode' => 'Error', 'Message' => "Sorry, User ID:- $vehicle already registered") ;
//   echo json_encode($resp);
// }else{
// $speed = $data->speed;
  $query2 = "insert into certificates (ownerName,mobile,vehicleNo,engineNo,address,technicianName,chassisNo,manufacturer,makerClassification,registrationDate,speed,installationDate,roto,invoiceNo) VALUES ('$ownername','$mobile','$vehicle','$engine','$address','$chassi','$installationdate','$manufacturer','$makerclassification','$registrationdate','$speed','$technicianname','$invoiceno','$roto')";
  // echo $query2;
  // $data2 = mysqli_query($connection,$query2);
  if ($connection->query($query2) === TRUE) {
    $connection->close();
    $resp = array('resCode' => 'Ok', 'Message' => 'User registered successful') ;
    echo json_encode($resp);
  } else {
    $resp = array('resCode' => 'Error', 'Message' => 'Sorry, User registration failed') ;
    echo json_encode($resp);
  }
// }
?>