var user = localStorage.getItem('user');
if(user){
	user = JSON.parse(user)
}else{
	logoutFunction();
}
$( document ).ready(function() {
	console.log("user : ",user);
	$(".userName").html(user.first_name)
});