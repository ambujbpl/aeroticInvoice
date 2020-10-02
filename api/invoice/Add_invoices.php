<?php
if((isset($_POST["product_details"]) && (isset($_POST["invoiceobj"])))){
  include('./../config/connection.php');
  $x = $_POST["product_details"];
  $y = $_POST["invoiceobj"];

  $query = "INSERT INTO invoices (invoice_id, invoice_date, subtotal, gst, total, paid, due,updated_by, address, customer_address,product_details) VALUES";
  $query .="('".$y["Invoice_ID"]."','".$y["Invoice_Date"]."','".$y["Subtotal"]."','".$y["Gst"]."','".$y["Total"]."','".$y["Amount_Paid"]."','".$y["Amount_Due"]."','".$y["updated_by"]."','".$y["Address"]."','".$y["customer_address"]."','".$x."'),";
  $query = rtrim($query,",");
  // echo $query;
  if (!mysqli_query($connection,$query)) {
    $resp = array('resCode' => 'Error', 'Message' => 'Error occurred during save this record') ;
    echo json_encode($resp);
  } else {
    include('./../custom/custom_query_function.php');
    runCustomQuery("update basic set InvoiceCount=InvoiceCount+1;");
    $resp = array('resCode' => 'Ok', 'Message' => 'Records Saved Successfully!') ;
    echo json_encode($resp);
  }
} else {
  $resp = array('resCode' => 'Error', 'Message' => 'Error occurred during save this record') ;
  echo json_encode($resp);
}
?>