var user = localStorage.getItem('user');
if(user){
	user = JSON.parse(user);
}else{
	logoutFunction();
}
$( document ).ready(function() {
	$(".userName").html(user.first_name);
	if(user.profile_file_name && user.profile_file_name  !=undefined && user.profile_file_name != ""){
		$(".img-profile").attr("src","profilePic/" + user.profile_file_name);
	} else {
		$(".img-profile").attr("src","profilePic/defualt.png");
	}
});