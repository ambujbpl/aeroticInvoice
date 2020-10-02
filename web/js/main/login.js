var user = localStorage.getItem('user');
if(user){
  console.log('user : ',user);
  location.href = './dashboard.html';
}
$(document).ready(function() {
    $("#loginForm").validate({
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
  $.when(Posthandler("./../api/user/user_login.php", obj, true)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
      var obj = {"userid":res.userid,"token":res.token};
      updateUserDetails(obj);
    } else {
      $('#errorDiv').html(res.message);
      $.notify(res.message, "error");
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });
};
function updateUserDetails(obj){
  $.when(Posthandler("./../api/user/user_details.php", obj, true)).done(function(data) {
    if(data.resCode.trim().toLowerCase() == "ok") {          
      $.notify(data.message, "success");
      data.data[0].token = obj.token;
      localStorage.setItem("user",JSON.stringify(data.data[0]))
      setTimeout(()=>{
        location.href = './dashboard.html';
      },250);
    } else {
      $('#errorDiv').html(data.message);
      $.notify(data.message, "error");
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });
}