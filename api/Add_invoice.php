<?php
if((isset($_POST["myTableArray"]) && (isset($_POST["Rest"]))))
{
  include('./../config/connection.php');
  $x = $_POST["myTableArray"];
  $y = $_POST["Rest"];
  $query1 = "INSERT INTO invoice VALUES();";
  $data1 = mysqli_query($connection,$query1);
  $total1 = mysqli_num_rows($data1);
  echo $total1;
  if($data1){
    $query3 = "INSERT INTO invoice_item (name,dei, value, quantity,total,	fk_id_Invoice) VALUES";
    for ($i=0;$i<sizeof($x);$i++)
      {
        $query3 .="('".$x[$i]["productName"]."','".$x[$i]["productDesc"]."','".$x[$i]["productCost"]."','".$x[$i]["productQuantity"]."','".$x[$i]["productPrize"]."','".$y["Invoice"]."'),";
      }
      $query3 = rtrim($query3,",");
    if(!mysqli_query($connection,$query3))
    	echo "Records error<br />";
    else
    {
          $query4 = "INSERT INTO invoice_more (invoice_date, subtotal, gst, total, paid, due,	fk_ID_Invoice, Address, PartyAddress) VALUES";
          $query4 .="('".$y["Invoice_Date"]."','".$y["Subtotal"]."','".$y["Gst"]."','".$y["Total"]."','".$y["Amount_Paid"]."','".$y["Amount_Due"]."','".$y["Invoice"]."','".$y["Address"]."','".$y["PartyAddress"]."'),";
              $query4 = rtrim($query4,",");
           if(!mysqli_query($connection,$query4))
            {
              $resp = array('resCode' => 'Error', 'Message' => 'Records error to save') ;
              echo json_encode($resp);
            }
          else
           {
              $resp = array('resCode' => 'Ok', 'Message' => 'Records Saved Successfully!') ;
              echo json_encode($resp);
            }
    }
  }
}
?>
