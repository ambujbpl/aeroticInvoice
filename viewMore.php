<?php
include('config/connection.php');
$query2 = "select * from basic";
$data2 = mysqli_query($connection,$query2);
$total2 = mysqli_num_rows($data2);
if($total2 >= 1){
	$result2 = mysqli_fetch_assoc($data2);
}else {
  // echo "No Record Found!";
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
  <link rel="icon" href="./imges/logoNew1.png" type="image/x-icon">
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
		#my_file_output > tr > td{
			text-align: center !important;
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

    <div id="header">INVOICE</div>

    <div id="identity">

      <!-- <div id="address"><?php echo $result2['Name']."\n<br />".$result2['Address']."\n<br />Phone:- ".$result2['Phone']."\n<br />GST:-".$result2['Gst']?></div> -->
			<div id="address" class="address">
				From:<br>
				<span style="height: 20px; font-size:15px;">Name: <span rows="1" id="selfName" style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">Address: <span id="selfAddress"  style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">Phone: <span id="selfPhone"  style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">GST: <span id="selfGst" style="height:14px;"></span></span><br>
			</div>

			<div id="address" class="partyAddress" style="margin-left:15px">
				To (Party Details):<br>
				<span style="height: 20px; font-size:15px;">Name: <span rows="1" id="PartyName" style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">Address: <span id="PartyAddress"  style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">Phone: <span id="PartyPhone"  style="height:14px;"></span></span><br>
				<span style="height: 20px; font-size:15px;">GST: <span id="PartyGst" style="height:14px;"></span></span><br>
			</div>
      <div id="logo">
<!--
        <div id="logoctr">
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

			<div id="customer-title" style="width:100%;"><span style="height: 20px; font-size:15px;">Registration Number:<span id="registrationNumber" style="height:14px;">
</span><span>

      <table id="meta">
        <tr>
          <td class="meta-head">Invoice #</td>
          <td>
						<span id='invoiceNumber'></span><span>/2018-19</span>
          </td>
        </tr>
        <tr>
          <td class="meta-head">Date</td>
          <td><span class="date"></span></td>
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
          <th>Unit Cost</th>
          <th>Quantity</th>
          <th>Price</th>
        </tr>
      </thead>
			<tbody id="my_file_output">

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
        <td class="total-line">Gst ( <span id="gstPercent"></span> % )</td>
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
        <td class="total-line">Amount Paid</td>
        <td class="total-value">
					<i class='fa fa-inr'></i> <span id="paid"></span>
				</td>
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
  </div>
  <div class="print_Div" id="print_Div">
    <button type="button" name="button" id="print">Print Invoice</button>
  </div>
  <script type="text/javascript" src='js/jquery.min.js'></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/changeColor.js"></script>
  <script type="text/javascript" src='js/example.js'></script>
  <script type="text/javascript" src='js/sweetalert.min.js'></script>
  <!-- <script type="text/javascript" src="js/print.min.js"></script> -->
  <script type="text/javascript">
		var obj = JSON.parse(sessionStorage.getItem("info"));
		// console.log(obj);
		$('#home_Title').html("View More about Invoice Number:-"+obj.Invoice);
		$.ajax({
      type: 'POST',
      url: './api/View_More.php',
      data: {"obj":obj},
      dataType: "JSON",
    }).done(function(res) { // if getting done then call.
      // console.log(res);
      var invoice_more = res.Data[0]["invoice_more"];
      var invoice_item = res.Data[0]["invoice_item"];
			// console.log("invoice_more????????????", invoice_more);
      // console.log("invoice_item????????????", invoice_item);
      $.each(invoice_item, function(i, arr) {
        var body = "<tr>";
        body += "<td style='color: green;'>" + arr.name + "</td>";
        body += "<td style='color: green;'>" + arr.dei + "</td>";
        body += "<td style='color: green;'>" + arr.value + "</td>";
        body += "<td style='color: green;'>" + arr.quantity + "</td>";
        body += "<td style='color: orange;'>" + arr.total + "</td>";
	body += "</tr>";
        // console.log("body>>>", body);
        $("#my_file_output").append(body);
      });
			// console.log(invoice_more[0].fk_ID_Invoice);
			if(invoice_more[0].fk_ID_Invoice <10){
				$('#invoiceNumber').html('00'+invoice_more[0].fk_ID_Invoice);
			}else {
				$('#invoiceNumber').html('0'+invoice_more[0].fk_ID_Invoice);
			}
			$('.date').html(invoice_more[0].invoice_date);
			$('#subtotal').html(invoice_more[0].subtotal);
			$('#gst').html(invoice_more[0].gst);
			$('#total').html(invoice_more[0].total);
			$('#paid').html(invoice_more[0].paid);
			$('.due').html(invoice_more[0].due);
			// $('.address').html(invoice_more[0].Address);
			// $('.partyAddress').html(invoice_more[0].PartyAddress);
			//if(parseInt(invoice_more[0].fk_ID_Invoice) <116){
			//   $('.address').html(invoice_more[0].Address);
			//   $('.partyAddress').html(invoice_more[0].PartyAddress);
			//}else {
                       console.log("invoice_more self : ",invoice_more[0].Address);
                       console.log("invoice_more party : ",invoice_more[0].PartyAddress);
			var Address = JSON.parse(invoice_more[0].Address);
			var PartyAddress = JSON.parse(invoice_more[0].PartyAddress);
			// console.log("Address",Address);
			// console.log("PartyAddress",PartyAddress);
                          $('#selfName').html(Address.selfName);
			  $('#selfAddress').html(Address.selfAddress);
			  $('#selfPhone').html(Address.selfPhone);
			  $('#selfGst').html(Address.selfGst);
			  $('#gstPercent').html(Address.gstPercent);
			  $('#PartyName').html(PartyAddress.PartyName);
			  $('#PartyAddress').html(PartyAddress.PartyAddress);
			  $('#PartyPhone').html(PartyAddress.PartyPhone);
			  $('#PartyGst').html(PartyAddress.PartyGst);
			//}			
			$('#registrationNumber').html(PartyAddress.Registration);
                        if((PartyAddress.header != "")||(PartyAddress.header != undefined)){
                           $('#header').html(PartyAddress.header);
                         }
			}).fail(function(error) {
      // console.log(error.Message);
      swal(error.resCode, error.Message, "error");
    });
		$("#print").click(function() { // calls the id of the button that will print
      $('.theme-config').addClass('hide');
      $('.print_Div').addClass('hide');
			$('.home').addClass('hide');
      if (print()) { // shows print preview.
        $('.theme-config').removeClass('hide');
        $('.print_Div').removeClass('hide');
				$('.home').removeClass('hide');
      } else { // else statement will check if cancel button is clicked.
        $('.theme-config').removeClass('hide');
        $('.print_Div').removeClass('hide');
	$('.home').removeClass('hide');
      }
    });

  </script>
</body>

</html>
			