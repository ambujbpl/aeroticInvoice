$(document).ready(function() {
  jQuery.validator.addMethod("lettersonly", function(value, element) {
    return this.optional(element) || /^[a-zA-Z]+$/i.test(value);
  }); 
  jQuery.validator.addMethod("specialChars", function( value, element ) {
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var key = value;

    if (!regex.test(key)) {
       return false;
    }
    return true;
  });
  $("#registrationForm").validate({
    // errorPlacement: function(error, element) {
    //     // Append error within linked label
    //     $(element)
    //         .closest("form")
    //         .find("label[for='" + element.attr("id") + "']")
    //         .append(error);
    // },
    // errorElement: "span",
    // Specify validation rules
    rules: {
        first_name: {
            required:true,
            lettersonly:true
        },
        last_name: {
            required:true,
            lettersonly:true
        },
        email: {
            required:true,
            email:true
        },
        mobile: {
            required:true,
            number:true,
            minlength: 10,
            maxlength: 15
        },
        user_id: {
            required:true,
            specialChars:true
        },
        password: {
            required: true,
            minlength: 5,
            maxlength: 10
        }
      },
      // Specify validation error messages
      messages: {
        first_name: {
            required:"Please enter your First Name",
            lettersonly:"Name will be alphabetic letters only"
        },
        last_name: {
            required:"Please enter your Last Name",
            lettersonly:"Last Name will be alphabetic letters only"
        },
        email: {
            required:"Please enter your Email ID",
            email:"Enter a valid Email Address"
        },
        mobile: {
            required: "Please enter your Mobile Number",
            number: "Please enter valid Mobile Number",
            minlength: "Your password must be at least 5 characters long",
            maxlength: "Your password must be at most 10 characters long"
        },
        user_id: {
            required:"Please enter your any User ID",
            specialChars: "please use only alphanumeric or alphabetic characters"
        },
        password: {
            required: "Please enter your Password",
            minlength: "Your Password must be at least 5 characters long",
            maxlength: "Your Password must be at most 10 characters long"
        }
      },
      // Make sure the form is submitted to the destination defined
      // in the "action" attribute of the form when valid
      submitHandler: function(form) {
        formSubmitFunction();
      }
  });
});

uploadFile = () => {

}

function formSubmitFunction() {
    $('#errorDiv').html("submit");
    var first_name = $('#first_name').val();
    var last_name = $('#last_name').val();
    var email = $('#email').val();
    var mobile = $('#mobile').val();
    var user_id = $('#user_id').val();
    var password = $('#password').val();
    var obj = {
        "first_name":first_name,
        "last_name":last_name,
        "email_address":email,
        "mobile_number":mobile,        
        "userid": user_id,
        "password": password,
        
    }
    console.log(obj,'-----------------');
    $.ajax({
        type: "POST",
        url: "/aeroticInvoice/api/user/user_registration.php",
        data: JSON.stringify(obj),
        contentType: "application/json",
        dataType: "json",
        success: function(data) {
            if (data.resCode.trim().toLowerCase() == "ok") {
                $.notify(data.Message, "success");
                $('#errorDiv').html(data.Message);
                setTimeout(()=>{
                    location.href = './login.html';
                },250);
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
