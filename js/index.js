$( document ).ready(function() {
	$("#loginForm").submit(function (e) {
		e.preventDefault();
		$('#errorDiv').html("");
		var userid = $('#inputUserID').val();
		var password = $('#inputPassword').val();
		if(userid == ""){
			$('#errorDiv').html("User Id is required.");
		}else if(password == ""){			
			$('#errorDiv').html("Password is required.");
		}else{
			$('#errorDiv').html("");
			var obj = {
				"userid" : userid,
				"password" : password
			}
			$.ajax({
				type: "POST",
				url: "/aeroticInvoice/api/login.php",
				data: JSON.stringify(obj),
				contentType: "application/json",
        		dataType: "json",
				success: function(data) {
					console.log("data : ",data);
					if(data.resCode.trim().toLowerCase() == "ok"){
						location.href = 'viewInvoice.php';
					}else{
						$('#errorDiv').html(data.Message);
					}
				},
				error: function(err) {
					$('#errorDiv').html("Something went wrong please contact your administrator.");
				}
			})
		}
	});
});
