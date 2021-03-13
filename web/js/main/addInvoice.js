var user = localStorage.getItem('user');
if (user) {
  user = JSON.parse(user);
  if (user.role.toLowerCase() != "admin") {
    $.notify('Sorry, You do not have admin access', 'error');
    setTimeout(() => {
      window.close();
    }, 1500)
  }
} else {
  logoutFunction();
}

$.urlParam = function(name){
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  return results[1] || 0;
}

$(document).ready(async function() {
  await updateBasics();
  hideLoader();
  $(".datepicker-default").datepicker({
    "dateFormat": 'dd-mm-yy',
    "todayHighlight": true,
    "setDate": new Date(),
    "autoclose": true
  });
  // $(".datepicker-default").datepicker("setDate", new Date());
  var today = new Date();
  $("#date").val(moment(today).format('DD-MM-YYYY'));
});

/**
 * { function_description }
 */
updateBasics = async () => {
  executeCustomQueryHtml("select * from basic", "updatebasics", "", "");
  // executeCustomQueryHtml("select count(*) as invoiceNumber from invoices","updateinvoicenumber","","");
  executeCustomQueryHtml("select * from product", "updateInvoiceItems", "itemsTableBody", "");
}

function saveInDBFunction() {

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
      "productName": updateString(productName,0,1,0),
      "productDesc": updateString(productDesc,0,1,0),
      "productCost": updateString(productCost,0,0,1),
      "productQuantity": updateString(productQuantity,0,0,1),
      "productPrize": updateString(productPrize,0,0,1)
    };
    if (productName) {
      myTableArray.push(obj);
    }
  });
  var Invoice_ID = $('#invoiceNumber').text();
  var Invoice_Date = $('#date').val();
  console.log("Invoice_Date old : ", Invoice_Date);
  Invoice_Date = moment(Invoice_Date, "DD-MM-YYYY").format('YYYY-MM-DD');
  console.log("Invoice_Date new : ", Invoice_Date);
  var Subtotal = $('#subtotal').text() || '0';
  var Gst = $('#gst').text() || '0';
  var Total = $('#total').text() || '0';
  var Amount_Paid = $('#paid').val() || '0';
  var Amount_Due = $('#due').text() || '0';
  var selfName = updateString($('#selfName').val(),1,0,0);
  var selfAddress = updateString($('#selfAddress').val(),0,1,0);//.trim().replace(/[^a-zA-Z0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var selfPhone = updateString($('#selfPhone').val(),0,0,1);//.trim().replace(/[^0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var selfGst = updateString($('#selfGst').val(),0,1,0);//.trim().replace(/[^a-zA-Z0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var gstPercent = $('#gstPercent').val().trim();
  var PartyName = updateString($('#PartyName').val(),1,0,0);//.trim().replace(/[^a-zA-Z ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var PartyAddress = updateString($('#PartyAddress').val(),0,1,0);//.trim().replace(/[^a-zA-Z0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var PartyPhone = updateString($('#PartyPhone').val(),0,0,1);//.trim().replace(/[^0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var PartyGst = updateString($('#PartyGst').val(),0,1,0);//.trim().replace(/[^a-zA-Z0-9 ]/g, "").replace(/(\r\n|\n|\r)/gm, "");
  var registrationNumber = $('#registrationNumber').val().trim();
  var header = $('#header').val();
  var Address = {
    "selfName": selfName,
    "selfAddress": selfAddress,
    "selfPhone": selfPhone,
    "selfGst": selfGst,
    "gstPercent": gstPercent,
  };
  var customer_address = {
    "PartyName": PartyName,
    "PartyAddress": PartyAddress,
    "PartyPhone": PartyPhone,
    "PartyGst": PartyGst,
    "Registration": registrationNumber,
    "header": header,
  };
  var invoiceobj = {
    "Invoice_Date": Invoice_Date,
    "Subtotal": Subtotal,
    "Gst": Gst,
    "Total": Total,
    "Amount_Paid": Amount_Paid,
    "Amount_Due": Amount_Due,
    "Address": JSON.stringify(Address),
    "customer_address": JSON.stringify(customer_address),
    "Registration": registrationNumber,
    "header": header,
    "updated_by": user.userid,
    "Invoice_ID": Invoice_ID
  }
  console.log("invoiceobj : ", invoiceobj,"\nproduct_details",myTableArray);
  $.ajax({
    type: 'POST',
    url: './../../api/invoice/Add_invoices.php',
    data: {
      "invoiceobj": invoiceobj,
      "product_details": JSON.stringify(myTableArray)
    },
    dataType: "JSON",
  }).done(function(data) { // if getting done then call.
    if (data.resCode == "Ok") {
      swal(data.resCode, data.Message, "success");
      $('#saveInDBButton').remove();
    } else {
      swal(data.resCode, data.Message, "error")
    }
  });
};
updateString = (str,isOnlyAlpha,isAlphaNumeric,isOnlyDigit) => {
  if(str){   
    if(isOnlyAlpha) str = str.trim().replace(/[^a-zA-Z ]/g, " "); // Only Accept Alphabetic Values rest replace with ""
    if(isAlphaNumeric) str = str.trim().replace(/[^a-zA-Z0-9 ]/g, " ") // Accept only Alphabetic Numeric Values  rest replace with ""
    if(isOnlyDigit) str = str.replace(/[^0-9 ]/g, " ") // Only Digit Values accepted rest replace with ""
    return str.replace(/(\r\n|\n|\r)/gm, " ");// Carrage value replace  
  }
  return ''
}
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