$( document ).ready(function() {
	$("#loginForm").submit(function (e) {
		e.preventDefault()
		var userid = $('#inputUserID').val();
		var password = $('#inputPassword').val();
		console.log("userid : ",userid);
		console.log("password : ",password);
	})
});
