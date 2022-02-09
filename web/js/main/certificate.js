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
	// console.log('res : ',res);
	if(res.resCode.trim().toLowerCase() == "ok") {
	  $.notify(res.message, "success");          
	  setTimeout(async ()=>{
	    await updatePUCDetailsHtml(res.data[0]);
	    // hideLoader();
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
  console.log('res : ',res)
 $("#invoice_no").html(res["invoiceNo"]);
 $("#vehicle").html(res["vehicleNo"]);
 $("#chassi").html(res["chassisNo"]);
 $('#district').html(res.district);
 $("#engine").html(res["engineNo"]);
 $("#owner_name").html(res["ownerName"]);
 $("#registration_date").html(res["registrationDate"]);
 $("#vehicle_norms").html(res["vehicleNorms"]);
 $("#vehicle_class").html(res["vehicleClass"]);
 $('#maker_classification').html(res.makerClassification);
 $('#vehicle_model').html(res.vehicleModel);
 $('#fuel_type').html(res.fuelType);
 $('#installation_date').html(res.installationDate);
 $('#test_fees').html(res["testFees"]);
 $('.fuel_type').html(res["fuelType"]);
 if (res.image) $('#certificate_img').attr("src","./../" + res.image);
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
$('#home_Title').html("Add Certificate Page");