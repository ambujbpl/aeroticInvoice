<?php
include('config/connection.php');
$query = "select * from invoice";
$data = mysqli_query($connection,$query);
$total = mysqli_num_rows($data);
if($total >= 1){
	$query1 = "select * from invoice where id=(select max(id) from invoice);";
	$data1 = mysqli_query($connection,$query1);
	$result = mysqli_fetch_assoc($data1);
}else {
// New Project start command
// TRUNCATE TABLE invoice;
// DELETE FROM invoice WHERE id > 0
// TRUNCATE TABLE invoice_item;
// TRUNCATE TABLE invoice_more;
// ALTER TABLE invoice AUTO_INCREMENT = 1000;
}
$query2 = "select * from basic";
$data2 = mysqli_query($connection,$query2);
$total2 = mysqli_num_rows($data2);
if($total2 >= 1){
	$result2 = mysqli_fetch_assoc($data2);
}else {
  // echo "No Record Found!";
}
$query3 = "select * from product";
$data3 = mysqli_query($connection,$query3);
$total3 = mysqli_num_rows($data3);
	while ($row = $data3->fetch_assoc())
{
    $new_array[$row['id']]['id'] = $row['id'];
    $new_array[$row['id']]['Name'] = $row['Name'];
    $new_array[$row['id']]['Type'] = $row['Type'];
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <meta name="description" content="Speed Governor, Saniya Enterprises, Aerotic India Pvt Ltd">
  <meta name="author" content="Ambuj Dubey">
  <link rel="icon" href="./images/logoNew1.png" type="image/x-icon">
  <title>Saniya Invoice</title>
  <!-- Plugins CSS -->
  <link rel="stylesheet" type="text/css" href="font-awesome/css/font-awesome.css">
  <link rel='stylesheet' type="text/css" href='css/style.css'>
  <link rel="stylesheet" type="text/css" href="css/print.min.css">
  <style>
    #items td {
      border: 1px solid black !important;
    }
    .blank {
      width: 50%;
    }
		#seal{
		  margin-top: 50px;
		}
		.print_Div {
		  text-align: center;
		  margin-top: 100px !important;
		}
  </style>
</head>

<body>
	<div class="home">
		<a href="./index.php" class="fa fa-home" aria-hidden="true">Home</a> > <span id="home_Title"></span>
	</div>
  <!-- theme-configration -->
  <div class="theme-config">
    <div class="theme-config-box">
      <div class="spin-icon">
        <i class="fa fa-cogs fa-spin"></i>
      </div>
      <div class="skin-settings">
        <div class="title">Configuration <br>
          <small style="text-transform: none;font-weight: 400">
              Config box designed for change UI background color.
          </small></div>

        <div class="title">Body Background</div>
        <div class="setings-item  body_Color">
          <span style="background: #ffcccc;"></span>
          <span style="background: #ffc6b3;"></span>
          <span style="background: #ffe6cc;"></span>
          <span style="background: #d9ffcc;"></span>
          <span style="background: #ffffff;"></span>
        </div>
        <!-- <div class="title">Body Font</div>
        <div class="setings-item body_Font">
          <span style="font-family: Times New Roman;">A</span>
          <span style="font-family: courier;">A</span>
          <span style="font-family: arial;">A</span>
          <span style="font-family: Arial Black;">A</span>
          <span style="font-family: georgia;">A</span>
        </div> -->
        <div class="title">Header Background</div>
        <div class="setings-item header_bgColor">
          <span style="background: #4d2600;"></span>
          <span style="background: #330000;"></span>
          <span style="background: #00331a"></span>
          <span style="background: #00004d"></span>
          <span style="background: #222"></span>
        </div>
        <div class="title">Table Header Background</div>
        <div class="setings-item table_header_bgColor">
          <span style="background: #d6d6c2;"></span>
          <span style="background: #c2c2a3;"></span>
          <span style="background: #adad85"></span>
          <span style="background: #8a8a5c"></span>
          <span style="background: #eee"></span>
        </div>
      </div>
    </div>
  </div>
  <!-- theme-configration -->

  <div id="page-wrap">
    <div><textarea id="header">INVOICE</textarea></div>

    <div id="identity">

      <div id="address" class="address">
				From:<br>
				<span style="height: 20px; font-size:15px;">Name: <textarea rows="1" id="selfName" style="height:14px;"><?php echo $result2['Name']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">Address: <textarea id="selfAddress"  style="height:14px;"><?php echo $result2['Address']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">Phone: <textarea id="selfPhone"  style="height:14px;"><?php echo $result2['Phone']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">GST: <textarea id="selfGst" style="height:14px;"><?php echo $result2['Gst']; ?></textarea></span><br>
			</div>

			<div id="address" class="partyAddress" style="margin-left:15px">
				To (Party Details):<br>
				<span style="height: 20px; font-size:15px;">Name: <textarea rows="1" id="PartyName" style="height:14px;"><?php echo $result2['PartyName']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">Address: <textarea id="PartyAddress"  style="height:14px;"><?php echo $result2['PartyAddress']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">Phone: <textarea id="PartyPhone"  style="height:14px;"><?php echo $result2['PartyPhone']; ?></textarea></span><br>
				<span style="height: 20px; font-size:15px;">GST: <textarea id="PartyGst" style="height:14px;"><?php echo $result2['PartyGst']; ?></textarea></span><br>
			</div>

      <div id="logo">

        <!-- <div id="logoctr">
          <a href="javascript:;" id="change-logo" title="Change logo">Change Logo</a>
          <a href="javascript:;" id="save-logo" title="Save changes">Save</a> |
          <a href="javascript:;" id="delete-logo" title="Delete logo">Delete Logo</a>
          <a href="javascript:;" id="cancel-logo" title="Cancel changes">Cancel</a>
        </div>

        <div id="logohelp">
          <input id="imageloc" type="text" size="50" value="" /><br /> (max width: 540px, max height: 100px)
        </div> -->
        <img id="image" src="images/logoNew1.png" alt="logo" width="40" height="40" />
      </div>
    </div>

    <div style="clear:both"></div>

    <div id="customer">

      <div id="customer-title" style="width:100%;"><span style="height: 20px; font-size:15px;">Registration Number:<textarea id="registrationNumber" style="height:14px;">
<?php echo $result2['HsnCode']?></textarea><span>

      <table id="meta">
        <tr>
          <td class="meta-head">Invoice #</td>
          <td>
            <?php
						// echo "result['id'] ==".$result['id'];
							if (($result['id'] >= 0) && ($result['id'] < 9)){
								// echo $result['id'];
                //$result['id'] += 1;//old
                $result['id'] += 10;//new
                echo "<span id='invoiceNumber'>0".$result['id']."</span>";
              }
              else {
								$result['id']+=1;
								echo "<span id='invoiceNumber'>0".$result['id']."</span>";
							}
            ?><span>/2019-20</span>
<!--<textarea></textarea>-->
          </td>
        </tr>
        <tr>
          <td class="meta-head">Date</td>
          <td><textarea id="date"></textarea></td>
        </tr>
        <tr>
          <td class="meta-head">Amount Due</td>
          <td>
            <div><i class="fa fa-inr"></i>
              <span class="due"></span>
            </div>
          </td>
        </tr>

      </table>

    </div>

    <table id="items" style>
      <thead>
        <tr>
          <th>Item</th>
          <th>Remark</th>
          <th>Unit Cost (<i class='fa fa-inr'></i>)</th>
          <th>Quantity</th>
          <th>Price</th>
        </tr>
      </thead>
      <tbody>
        <?php
    			foreach($new_array as $array)
    			{
						echo  "<tr class='item-row'>
						<td class='item-name'>
						  <div class='delete-wpr'><textarea id='Name'>".$array['Name']."</textarea><a class='delete' href='javascript:;' title='Remove row'><i class='fa fa-times' aria-hidden='true'></i>
						</a></div>
						</td>
						<td class='description'><textarea id='Type'>".$array['Type']."</textarea></td>
						<td><textarea class='cost'></textarea></td>
						<td><textarea class='qty'></textarea></td>
						<td><i class='fa fa-inr'></i> <span class='price'></span></td>
					 </tr>";
					}
				?>
          <tr id="hiderow" class="hiderow">
            <td colspan="5"><a id="addrow" href="javascript:;" title="Add a row"><i class='fa fa-plus' aria-hidden='true'></i>Add a row</a></td>
          </tr>
      </tbody>
    </table>
    <table style="width:100%;">

      <tr>
        <td colspan="4" class="blank"></td>
        <td class="total-line">Subtotal</td>
        <td class="total-value">
          <i class='fa fa-inr'></i> <span id="subtotal"></span>
        </td>
      </tr>
      <tr>
        <td colspan="4" class="blank"></td>
        <td class="total-line">Gst ( <textarea id="gstPercent" style="height:14px;width:25px">18</textarea> %)</td>
        <td class="total-value">
          <i class='fa fa-inr'></i> <span id="gst"></span>
        </td>
      </tr>
      <tr>
        <td colspan="4" class="blank"> </td>
        <td class="total-line">Total</td>
        <td class="total-value">
          <i class='fa fa-inr'></i> <span id="total"></span>
        </td>
      </tr>
      <tr>
        <td colspan="4" class="blank"> </td>
        <td class="total-line">Amount Paid (<i class='fa fa-inr'></i>)</td>
        <td class="total-value"><textarea id="paid"></textarea></td>
      </tr>
      <tr>
        <td colspan="4" class="blank"> </td>
        <td class="total-line balance">Balance Due</td>
        <td class="total-value balance">
          <i class='fa fa-inr'></i> <span class="due" id="due"></span>
        </td>
      </tr>
    </table>

    <div id="terms">
      <h5>Terms</h5>
      <textarea>Please check the product serial number before receiving any product And GST include 9% SGST and 9% CGST(total 18% GST).</textarea>
    </div>

		<div id="seal" style="float:right;">
			<h5>Authorized Signatory</h5>
			<!-- <textarea>Please check the product serial number before receiving any product.</textarea> -->
		</div>
  </div>
  <div class="print_Div" id="print_Div">
    <button type="button" name="button" onclick="myFun()">Save in Database</button>
    <button type="button" name="button" id="print">Print Invoice</button>
  </div>
  <!-- <button type="button" name="button" onclick="myPrintFun()">Print Invoice</button> -->
  <!-- <button type="button" onclick="printJS('page-wrap', 'html')">Print Invoice</button> -->
  <script type="text/javascript" src='js/jquery.min.js'></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/changeColor.js"></script>
  <script type="text/javascript" src='js/example.js'></script>
  <script type="text/javascript" src='js/sweetalert.min.js'></script>
  <!-- <script type="text/javascript" src="js/print.min.js"></script> -->
  <script type="text/javascript">
    function myFun() {

      var myTableArray = [];
      var table = $("#items tbody");
      table.find('tr').each(function(i) {
        var $tds = $(this).find('td textarea'),
          $tds1 = $(this).find('td .price'),
          productName = $tds.eq(0).val(),
					// productName = $('textarea#Name').val(),
          productDesc = $tds.eq(1).val(),
					// productDesc = $('textarea#Type').val(),
          productCost = $tds.eq(2).val(),
          productQuantity = $tds.eq(3).val(),
          productPrize = $tds1.text();
        var obj = {
          "productName": productName,
          "productDesc": productDesc,
          "productCost": productCost,
          "productQuantity": productQuantity,
          "productPrize": productPrize
        };
        if (productName) {
          myTableArray.push(obj);
        }
      });
      // console.log("myTableArray>>>>>", myTableArray);
      var Invoice = $('#invoiceNumber').text();
      var Invoice_Date = $('#date').val();
      var Subtotal = $('#subtotal').text();
      var Gst = $('#gst').text();
      var Total = $('#total').text();
      var Amount_Paid = $('#paid').val();
      var Amount_Due = $('#due').text();
      var selfName = $('#selfName').val().trim();
      var selfAddress = $('#selfAddress').val().trim();
      var selfPhone = $('#selfPhone').val().trim();
      var selfGst = $('#selfGst').val().trim();
      var gstPercent = $('#gstPercent').val().trim();
      var PartyName = $('#PartyName').val().trim();
      var PartyAddress = $('#PartyAddress').val().trim();
      var PartyPhone = $('#PartyPhone').val().trim();
      var PartyGst = $('#PartyGst').val().trim();
      var registrationNumber = $('#registrationNumber').val().trim();
      var header = $('#header').val();
			var Address = {
				"selfName": selfName,
				"selfAddress": selfAddress,
				"selfPhone": selfPhone,
				"selfGst": selfGst,
				"gstPercent":gstPercent,
			};
			var PartyAddress = {
				"PartyName": PartyName,
				"PartyAddress": PartyAddress,
				"PartyPhone": PartyPhone,
				"PartyGst": PartyGst,
                                "Registration":registrationNumber,
                                "header":header,
			};
      var rest = {
        "Invoice": Invoice,
        "Invoice_Date": Invoice_Date,
        "Subtotal": Subtotal,
        "Gst": Gst,
        "Total": Total,
        "Amount_Paid": Amount_Paid,
        "Amount_Due": Amount_Due,
				"Address":JSON.stringify(Address),
				"PartyAddress":JSON.stringify(PartyAddress),
				"Registration":registrationNumber,
"header":header,
      }
      // console.log("rest>>>>>///",rest);
      $.ajax({
        type: 'POST',
        url: 'api/Add_invoice.php',
        data: {
          "Rest": rest,
          "myTableArray": myTableArray
        },
        dataType: "JSON",
      }).done(function(data) { // if getting done then call.
        swal(data.resCode, data.Message, "success")
      });
    };
    $("#print").click(function() { // calls the id of the button that will print
      $('.theme-config').addClass('hide');
      $('.hiderow').addClass('hide');
      $('.print_Div').addClass('hide');
			$('.home').addClass('hide');
      if (print()) { // shows print preview.
        $('.theme-config').removeClass('hide');
        $('.hiderow').removeClass('hide');
        $('.print_Div').removeClass('hide');
				$('.home').removeClass('hide');
      } else { // else statement will check if cancel button is clicked.
        $('.theme-config').removeClass('hide');
        $('.hiderow').removeClass('hide');
        $('.print_Div').removeClass('hide');
				$('.home').removeClass('hide');
      }
    });
		$('#home_Title').html("Add Invoice Page");
  </script>
</body>

</html>
				