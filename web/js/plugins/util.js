logoutFunction = () => {
  $.when(Gethandler("/aeroticInvoice/api/user/user_logout.php", {}, true)).done(function(data) {
    if(data.resCode.trim().toLowerCase() == "ok") {            
      $.notify(data.message, "success");
      localStorage.clear();
      setTimeout(()=>{
        location.href = '/';
      },150);
    } else {
      $('#errorDiv').html(data.message);
      $.notify(data.message, "error");
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });	
}