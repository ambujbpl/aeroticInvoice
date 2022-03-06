<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
$state = '';
$rtocode = '';
$district = '';
$ownername = '';
$mobile = '';
$address1 = '';
$technicianname = '';
$vehicle = '';
$engine = '';
$chassi = '';
$vehicleclass = '';
$vehiclemodel = '';
$fueltype = '';
$vehiclenorms = '';
$testfees = '';
$manufacturer = '';
$makerclassification = '';
$registrationdate = '';
$speed = '';
$installationdate = '';
$validity = '';
$roto = '';
$invoiceno = '';

$data = json_decode(file_get_contents("php://input"));
$state = $data->state;
$rtocode = $data->rtocode;
$district = $data->district;
$ownername = $data->ownername;
$mobile = $data->mobile;
$address = $data->address1;
$technicianname = $data->technicianname;
$vehicle = $data->vehicle;
$engine = $data->engine;
$chassi = $data->chassi;
$vehicleclass = $data->vehicleclass;
$vehiclemodel = $data->vehiclemodel;
$fueltype = $data->fueltype;
$vehiclenorms = $data->vehiclenorms;
$testfees = $data->testfees;
// $manufacturer = $data->manufacturer;
$makerclassification = $data->makerclassification;
$registrationdate = $data->registrationdate;
// $speed = $data->speed;
$installationdate = $data->installationdate;
$validity = $data->validity;
// $roto = $data->roto;
$invoiceno = $data->invoiceno;
$image = $data->image;
include('./../config/connection.php');
  // $query2 = "insert into certificates (state,rtoCode,district,ownerName,mobile,vehicleNo,engineNo,address,technicianName,chassisNo,vehicleClass,vehicleModel,fuelType,vehicleNorms,testFees,manufacturer,makerClassification,registrationDate,speed,installationDate,validity,roto,invoiceNo,image) VALUES ('$state','$rtocode','$district','$ownername','$mobile','$vehicle','$engine','$address','$technicianname','$chassi','$vehicleclass','$vehiclemodel','$fueltype','$vehiclenorms','$testfees','$manufacturer','$makerclassification','$registrationdate','$speed','$installationdate','$validity','$roto','$invoiceno','$image')";
  $query2 = "insert into certificates (state,rtoCode,district,ownerName,mobile,vehicleNo,engineNo,address,technicianName,chassisNo,vehicleClass,vehicleModel,fuelType,vehicleNorms,testFees,makerClassification,registrationDate,installationDate,validity,invoiceNo,image) VALUES ('$state','$rtocode','$district','$ownername','$mobile','$vehicle','$engine','$address','$technicianname','$chassi','$vehicleclass','$vehiclemodel','$fueltype','$vehiclenorms','$testfees','$makerclassification','$registrationdate','$installationdate','$validity','$invoiceno','$image')";
  // echo $query2;
  if ($connection->query($query2) === TRUE) {
    $connection->close();
    $resp = array('resCode' => 'Ok', 'Message' => 'Certificate added successful') ;
    echo json_encode($resp);
  } else {
    $resp = array('resCode' => 'Error', 'Message' => 'Sorry, Certificate submission failed') ;
    echo json_encode($resp);
  }
?>