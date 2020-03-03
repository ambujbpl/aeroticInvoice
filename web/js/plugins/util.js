
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
 * @param      {string}  extention  The extention
 */
OpenCustomModal = (modalName,extention) => {
  var model = "./modals/" + modalName + "." + extention;
  $('#customModalContainer').load(model);
  $('#custom-modal').modal('show');
};

/**
 * Opens a custom page.
 *
 * @class      OpenCustomPage (name)
 * @param      {string}  modalName  The modal name
 * @param      {string}  extention  The extention
 */
OpenCustomPage = (modalName,extention,type) => {
  var url = "./html/" + modalName + "." + extention + "?type=" + type;
  var win = window.open(url, '_blank');
  win.focus();
};

/**
 * Closes a page.
 */
closePage = () => {
  window.close();
}

/**
 * { function_description }
 *
 * @param      {<type>}  name    The name
 */
updateProfilePicName = (name) => {
  var user = localStorage.getItem('user');
  if(user){
    user = JSON.parse(user);
    if(name && name != undefined && name != ""){
      let query = `update users set profile_file_name="${name}", updated_by="${user.userid}" where id=${user.id}`;
      $.when(Posthandler("/aeroticInvoice/api/custom/custom_query.php", {'query':query}, true)).done(function(res) {
        if(res.resCode.trim().toLowerCase() == "ok") {
          $.notify(res.message, "success");          
          setTimeout(()=>{
            updateUserDetails(user.userid);
          },250);
        } else {
          $('#errorDiv').html(res.message);
          $.notify(res.message, "error");
        }
      }).fail(function() {
        $.notify("Something went wrong please contact your administrator.", "error");
        console.log("Error executing AJAX request. Please contact your administrator");
      });
    }
  }else{
    logoutFunction();
  }
}

/**
 * { function_description }
 *
 * @param      {<type>}  userid  The userid
 */
updateUserDetails = (userid) => {
  $.when(Posthandler("/aeroticInvoice/api/user/user_details.php", {"userid":userid}, true)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
      $.notify(res.message, "success");
      localStorage.setItem("user",JSON.stringify(res.data[0]))
      setTimeout(()=>{
        // location.href = './../dashboard.html';
        location.href = '/';
      },350);
    } else {
      $('#errorDiv').html(res.message);
      $.notify(res.message, "error");
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });  
}

/**
 * { function_description }
 *
 * @param      {<type>}  key     The key
 */
updateKeyFormat = (key) => {
  return key.replace("_", " ");
}

/**
 * Prints a function.
 *
 * @param      {<type>}  id      The identifier
 * @param      {<type>}  name    The name
 */
printFunction = (id,name) => {
  // window.print();
  var content = document.getElementById(id).innerHTML;
  var mywindow = window.open('', 'Print', 'height=600,width=800');
  mywindow.document.write('<html><head><title>Print</title>');
  mywindow.document.write('</head><body >');
  mywindow.document.write(content);
  mywindow.document.write('</body></html>');

  mywindow.document.close();
  mywindow.focus()
  mywindow.print();
  // mywindow.close();
  return true;
}