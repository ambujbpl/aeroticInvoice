$(document).ready(function() {
    $("#loginForm").validate({
        errorPlacement: function(error, element) {
            // Append error within linked label
            $(element)
                .closest("form")
                .find("label[for='" + element.attr("id") + "']")
                .append(error);
        },
        errorElement: "span",
        // Specify validation rules
        rules: {
            inputUserID: "required",
            inputPassword: {
                required: true,
                minlength: 5,
                maxlength: 10
            }
        },
        // Specify validation error messages
        messages: {
            inputUserID: "Please enter your User Id",
            inputPassword: {
                required: "Please enter your Password",
                minlength: "Your Password must be at least 5 characters long",
                maxlength: "Your Password must be at most 10 characters long"
            }
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function(form) {
            formSubmitFunction()
        }
    });
});

function formSubmitFunction() {
    $('#errorDiv').html("");
    var userid = $('#inputUserID').val();
    var password = $('#inputPassword').val();
    var obj = {
        "userid": userid,
        "password": password
    }
    $.ajax({
        type: "POST",
        url: "./../api/user/user_login.php",
        data: JSON.stringify(obj),
        contentType: "application/json",
        dataType: "json",
        success: function(data) {
            if (data.resCode.trim().toLowerCase() == "ok") {
            	$.notify(data.Message, "success");
                $('#errorDiv').html(data.Message);
                setTimeout(()=>{
                	location.href = 'viewInvoice.php';
                },100);
            } else {
                $('#errorDiv').html(data.Message);
                $.notify(data.Message, "error");
            }
        },
        error: function(err) {
            $('#errorDiv').html("Something went wrong please contact your administrator.");
        }
    })
};