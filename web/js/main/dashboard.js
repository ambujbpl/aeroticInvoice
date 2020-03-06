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
});

basicDetails = () => {
	$('.mainContainerRow').removeClass('hide');
	$('.mainContainerHeader').html('Basic Details');
	$('.mainContainerDropdownMenuLink').html('').append(`<div class="dropdown-header">Dropdown Basic Details Header:</div>`).append(`<a class="dropdown-item" onclick="basicDetails();">Basic Detail View</a>`).append(`<a class="dropdown-item" onclick="editMainContainerBody();">Edit Basic Detail</a>`);
	executeCustomQuery("select * from basic","mainContainerBody","basicDetails");
}