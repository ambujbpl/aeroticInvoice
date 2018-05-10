<?php
include('./../config/connection.php');
$x = $_POST["obj"];
// echo json_encode($x['Invoice']);
$query = "select * from invoice_more where fk_ID_Invoice=' ". $x['Invoice']. " '";
$query1 = "select * from invoice_item where fk_id_Invoice=' ". $x['Invoice']. " '";
$data = mysqli_query($connection,$query);
$total = mysqli_num_rows($data);
if($total >= 1){
	$data_array = array();
while($row = $data->fetch_assoc()){
$data_array[] = $row;
}
	// $resp = array('resCode' => 'Ok', 'Message' => $data_array) ;
	// echo json_encode($resp);
  $data1 = mysqli_query($connection,$query1);
  $total1 = mysqli_num_rows($data1);
  if($total1 >= 1){
    // echo "test";
  	$data_array1 = array();
  while($row = $data1->fetch_assoc()){
  $data_array1[] = $row;
  }
}
$new_Array[] =array("invoice_more"=>$data_array, "invoice_item"=>$data_array1);
$resp = array('resCode' => 'Ok', 'Data' => $new_Array) ;
echo json_encode($resp);
}else{
	$resp = array('resCode' => 'Error', 'Message' => 'No Records Found') ;
	echo json_encode($resp);
// echo "No Record Found!";
// TRUNCATE TABLE invoice;
// TRUNCATE TABLE invoice_item;
// TRUNCATE TABLE invoice_more;
// ALTER TABLE invoice AUTO_INCREMENT = 1000;
}
?>
