var user = localStorage.getItem('user');
if (user) {
  user = JSON.parse(user);  
} else {
  logoutFunction();
}

$.urlParam = function(name){
  var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
  return results[1] || 0;
}

$(document).ready(async function() {
  await viewInvoice($.urlParam('id'));
});

/**
 * { view Invoice function }
 *
 * @param      {<type>}  id      The identifier
 */
viewInvoice = async id => {
  console.log('id : ',id);
  let query = `select * from invoices where id=${id}`;
  $.when(Posthandler("./../../api/custom/custom_query.php", {'query':query, 'token': user.token}, true)).done(function(res) {
    console.log('res : ',res);
    if(res.resCode.trim().toLowerCase() == "ok") {
      $.notify(res.message, "success");          
      setTimeout(async ()=>{
        await updateInvoiceDetailsHtml(res.data[0]);
        hideLoader();
      },250);
    } else {
      $('#errorDiv').html(res.message);
      $.notify(res.message, "error");
      setTimeout(() => {
        window.close();
      }, 1500)
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });
};

updateInvoiceDetailsHtml = async (res) => {
 let address = JSON.parse(res.address);
 let customer_address = JSON.parse(res.customer_address);
 console.log('customer_address : ',customer_address);
 let product_details = JSON.parse(res.product_details);
 $("#selfName").html(address["selfName"]);
 $("#selfAddress").html(address["selfAddress"]);
 $("#selfPhone").html(address["selfPhone"]);
 $('#gst').html(res.gst);
 $("#selfGst").html(address["selfGst"]);
 $("#gstPercent").html(address["gstPercent"]);
 $("#date").html(res["invoice_date"]);
 $("#registrationNumber").html(customer_address["Registration"]);
 $("#invoiceNumber").html(res["invoice_id"]);
 $('#total').html(res.total);
 $('#subtotal').html(res.subtotal);
 $('#paid').html(res.paid);
 $('.due').html(res.due);
 $('#PartyName').html(customer_address["PartyName"]);
 $('#PartyAddress').html(customer_address["PartyAddress"]);
 $('#PartyPhone').html(customer_address["PartyPhone"]);
  $('#PartyGst').html(customer_address["PartyGst"]);
  $('#header').html(customer_address["header"]);

 var body = '';
 product_details.forEach((items) => {
    body += `<tr class='item-row'>
              <td class='item-name'>
                <div class='delete-wpr'><span id='Name'>${items['productName']}</span><a class='delete' href='javascript:;' title='Remove row'><i class='fa fa-times' aria-hidden='true'></i></a>
                </div>
              </td>
              <td class='description'><span>${items['productDesc']}</span></td>
              <td><span>${items['productCost']}</span></td>
              <td><span>${items['productQuantity']}</span></td>
              <td><i class='fa fa-inr'></i> <span>${items['productPrize']}</span></td>
            </tr>";`
  });
  $('#items').html(body);
 
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
$('#home_Title').html("View Invoice Page");