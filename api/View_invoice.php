<?php
include('./../config/connection.php');
$query = "select * from invoice_more";
$data = mysqli_query($connection,$query);
$total = mysqli_num_rows($data);
if($total >= 1){
	$data_array = array();
while($row = $data->fetch_assoc()){
$data_array[] = $row;
}
	$resp = array('resCode' => 'Ok', 'Message' => $data_array) ;
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
