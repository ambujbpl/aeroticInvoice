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
  <!-- <link rel='stylesheet' type="text/css" href='css/print.css'> -->
  <style type="text/css">
    .seeMore {
      padding: 10px;
      cursor: pointer;
    }

    table>tbody>tr>td {
      text-align: center !important;
    }
  </style>
</head>

<body>
  <div class="home">
    <a href="./index.php" class="fa fa-home" aria-hidden="true">Home</a> > <span id="home_Title"></span>
  </div>
  <div id="page-wrap">

    <textarea id="header">All INVOICES</textarea>

    <div style="clear:both"></div>

    <table id="items" style="max-height: 300px;overflow-y: scroll;display: inline-block;width: 100%;">
      <thead>
        <tr>
          <th>Id</th>
          <th>Invoice Number</th>
          <th>Invoice Date</th>
          <th>Subtotal(<i class='fa fa-inr'></i>)</th>
          <th>Gst Applied</th>
          <th>Total</th>
          <th>View More</th>
        </tr>
      </thead>
      <tbody id="my_file_output">

      </tbody>
    </table>

  </div>

  <script type="text/javascript" src='js/jquery.min.js'></script>
  <!-- custom js -->
  <script type="text/javascript" src="js/changeColor.js"></script>
  <script type="text/javascript" src='js/example.js'></script>
  <script type="text/javascript">
    $.ajax({
      type: 'GET',
      url: './api/View_invoice.php',
      data: {},
      dataType: "JSON",
    }).done(function(data) { // if getting done then call.
      console.log(data);
      var oJS = data.Message;
      console.log("oJS????????????", oJS);
      $.each(oJS, function(i, arr) {
        var body = "<tr>";
        body += "<td style='color: green;'>" + arr.id + "</td>";
        if(arr.fk_ID_Invoice <10){
          body += "<td style='color: green;'>00" + arr.fk_ID_Invoice + "</td>";
        }
        else{
          body += "<td style='color: green;'>0" + arr.fk_ID_Invoice + "</td>";
        }
        body += "<td style='color: green;'>" + arr.invoice_date + "</td>";
        body += "<td style='color: green;'>" + arr.subtotal + "</td>";
        body += "<td style='color: orange;'>" + arr.gst + "</td>";
        body += "<td style='color: orange;'>" + arr.total + "</td>";
        body += "<td class='seeMore' title='click here to see more information about Invoice ID:-" + arr.fk_ID_Invoice + "' style='color: red;'><i class='fa fa-eye' aria-hidden='true'></i></td>";
        body += "</tr>";
        console.log("body>>>", body);
        $("#my_file_output").append(body);
      });
    }).fail(function(error) {
      // console.log(error.Message);
      swal(error.resCode, error.Message, "error");
    });
    $(document).ready(function() {
      $('body').on('click', '.seeMore', function(e) { //used dynamically add dom removing purpose function
        // $("body .seeMore").on('click', function (e) {
        // $(".seeMore").click(function(e) {
        e.preventDefault();
        var Id = $(this).parents('tr').find('td:first').html();
        var Invoice = $(this).parents('tr').find('td:nth-child(2)').html();
        var info = {
          "Id": Id,
          "Invoice": Invoice
        };
        console.log("info", info);
        sessionStorage.setItem("info", JSON.stringify(info));
        window.location.replace("./viewMore.php");
      });
    });
    $('#home_Title').html("View Invoice Page");
  </script>
</body>

</html>
