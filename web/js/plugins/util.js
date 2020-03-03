
/**
 * { function_description }
 */
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


/**
 * Opens a custom modal.
 *
 * @class      OpenCustomModal (name)
 * @param      {string}  modalName  The modal name
 */
OpenCustomModal = (modalName) => {
  var model = "./modals/" + modalName + ".html";
  $('#customModalContainer').load(model);
  $('#custom-modal').modal('show');
};