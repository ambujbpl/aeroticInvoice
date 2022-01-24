var user = localStorage.getItem('user');
if (user) {
  user = JSON.parse(user);  
} else {
  logoutFunction();
}

$(document).ready(function() {
	getCertificateDataFromServer();
})
const getCertificateDataFromServer = () => {
	var url_string =  window.location.href
	var url = new URL(url_string);
	var id = url.searchParams.get("id");
	let query = `select * from certificates where id=${id}`;
	$.when(Posthandler("./../../api/custom/custom_query.php", {'query':query, 'token': user.token}, true)).done(function(res) {
	console.log('res : ',res);
	if(res.resCode.trim().toLowerCase() == "ok") {
	  $.notify(res.message, "success");          
	  setTimeout(async ()=>{
	    await updatePUCDetailsHtml(res.data[0]);
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
updatePUCDetailsHtml = async (res) => {
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

 // var body = '';
 // product_details.forEach((items) => {
 //    body += `<tr class='item-row'>
 //              <td class='item-name'>
 //                <div class='delete-wpr'><span id='Name'>${items['productName']}</span><a class='delete' href='javascript:;' title='Remove row'><i class='fa fa-times' aria-hidden='true'></i></a>
 //                </div>
 //              </td>
 //              <td class='description'><span>${items['productDesc']}</span></td>
 //              <td><span>${items['productCost']}</span></td>
 //              <td><span>${items['productQuantity']}</span></td>
 //              <td><i class='fa fa-inr'></i> <span>${items['productPrize']}</span></td>
 //            </tr>";`
 //  });
 //  $('#items').html(body);
}