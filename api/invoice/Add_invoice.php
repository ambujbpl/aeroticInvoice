<?php

header("Access-Control-Allow-Origin: * ");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$invoiceobj = '';

$data = json_decode(file_get_contents("php://input"));

$invoiceobj = $data->invoiceobj;
// echo $invoiceobj ->product_details;
// $product_details 
if($invoiceobj){
	include('./../config/connection.php');
	$query = "INSERT INTO invoices (invoice_date, subtotal, gst, total, paid, due, product_details, address, customer_address,updated_by) VALUES";
	$query .="('".$invoiceobj->Invoice_Date."','".$invoiceobj->Subtotal."','".$invoiceobj->Gst."','".$invoiceobj->Total."','".$invoiceobj->Amount_Paid."','".$invoiceobj->Amount_Due."','".json_encode($invoiceobj->product_details)."','".json_encode($invoiceobj->Address)."','".json_encode($invoiceobj->customer_address)."','".$invoiceobj->updated_by."')";
	// $query = rtrim($query,",");
	echo json_encode($query);	
	if(!mysqli_query($connection,$query))
	{
		$resp = array('resCode' => 'Error', 'Message' => 'Records error to save') ;
		echo json_encode($resp);
	}
	else
	{
		$resp = array('resCode' => 'Ok', 'Message' => 'Records Saved Successfully!') ;
		echo json_encode($resp);
	}
}else{
	$resp = array('resCode' => 'Error', 'Message' => 'Error to save this records') ;
	echo json_encode($resp);
}
?>
