var user = localStorage.getItem('user');
if(user){
	user = JSON.parse(user);
  if(user.role.toLowerCase() != "admin") {
    $.notify('Sorry, You do not have admin access','error');
    $('.adminAccess').addClass('hide');
  }
}else{
	logoutFunction();
}
$(document).ready(function() {
	$(".userName").html(user.first_name);
	if(user.profile_file_name && user.profile_file_name  !=undefined && user.profile_file_name != ""){
		$(".img-profile").attr("src","profilePic/" + user.profile_file_name);
	} else {
		$(".img-profile").attr("src","profilePic/defualt.png");
	}
	updateCounters();
});

/**
 * { Create Bill }
 */
createBill = () => {
	$('.mainContainerRow').removeClass('hide');
	$('.mainContainerHeader').html('Create Bill');
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Create Bill Header:</div>`).append(`<a class="dropdown-item" onclick="showAddBill();">Create a Bill</a>`).append(`<a class="dropdown-item" onclick="viewBill();">View Bill</a>`);
	// executeCustomQuery("select * from basic","mainContainerBody","basicDetails");
	showAddBill();	
}

/**
 * Shows the add bill.
 */
showAddBill = () => {
	window.open("./html/addInvoice.html", "_blank");
	// location.href = './html/addInvoice.php';
}

/**
 * { view the bill book }
 */
viewBill = () => {
	$('.mainContainerRow').removeClass('hide');
	$('.mainContainerHeader').html('View Bill Details');
	showServerSideDetailsByTableNameDataTable("invoices","mainContainerBody","invoicesDetails");
}
/**
 * { basic Details }
 */
basicDetails = () => {
	$('.mainContainerRow').removeClass('hide');
	$('.mainContainerHeader').html('Basic Details');
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Basic Details Header:</div>`).append(`<a class="dropdown-item" onclick="basicDetails();">Basic Detail View</a>`).append(`<a class="dropdown-item" onclick="editMainContainerBody();">Edit Basic Detail</a>`);
	executeCustomQuery("select * from basic","mainContainerBody","basicDetails");
}

/**
 * { product Details }
 */
productDetails = () => {
	$('.mainContainerRow').removeClass('hide');
	$('.mainContainerHeader').html('Product Details');
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Product Details Header:</div>`).append(`<a class="dropdown-item" onclick="productDetails();">View Product Detail</a>`).append(`<a class="dropdown-item" onclick="addNewProduct('product');">Add New Product</a>`);
	// executeCustomQuery("select * from product","mainContainerBody","productDetails");
	showServerSideDetailsByTableNameDataTable("product","mainContainerBody","productDetails");
}
/**
 * { reminders Details }
 */
remindersDetails = () => {
  $('.mainContainerRow').removeClass('hide');
  $('.mainContainerHeader').html('Reminders Details');
  $('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Reminders Details Header:</div>`).append(`<a class="dropdown-item" onclick="remindersDetails();">View Reminders Detail</a>`).append(`<a class="dropdown-item" onclick="addNewReminders('reminders');">Add New Reminders</a>`);
  // executeCustomQuery("select * from product","mainContainerBody","reminders");
  showServerSideDetailsByTableNameDataTable("reminders","mainContainerBody","remindersDetails");
}


/**
 * { update Counters }
 */
updateCounters = () => {
	executeCustomQuery("select count(*) as count from product","updatecounters","productCounts","");
  executeCustomQuery("select count(*) as count from invoices","updatecounters","invoicesCounts","");
  executeCustomQuery("select sum(paid) as count from invoices where (invoice_date between  DATE_FORMAT(NOW() ,'%Y-%m-01') AND NOW() )","updatecounters","sellCountMonthly","");
  executeCustomQuery("select sum(paid) as count from invoices","updatecounters","sellCountAnnually","");
}