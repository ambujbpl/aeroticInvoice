var user = localStorage.getItem('user');
if(user){
	user = JSON.parse(user);
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
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Create Bill Header:</div>`).append(`<a class="dropdown-item" onclick="createBill();">Create a Bill</a>`).append(`<a class="dropdown-item" onclick="editMainContainerBody();">Edit a Bill Detail</a>`);
	executeCustomQuery("select * from basic","mainContainerBody","basicDetails");
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
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Product Details Header:</div>`).append(`<a class="dropdown-item" onclick="productDetails();">View Product Detail</a>`).append(`<a class="dropdown-item" onclick="$('.add-record').click();">Add New Product</a>`);
	// executeCustomQuery("select * from product","mainContainerBody","productDetails");
	showServerSideDetailsByTableNameDataTable("product","mainContainerBody","productDetails");
}

/**
 * { update Counters }
 */
updateCounters = () => {
	executeCustomQuery("select count(*) as count from product","updatecounters","productCounts","");
}