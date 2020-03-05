
/**
 * { function_description }
 */
logoutFunction = () => {
  var user = localStorage.getItem('user');
  if(user)user=JSON.parse(user);
  $.when(Posthandler("/aeroticInvoice/api/user/user_logout.php", {userid:user.userid}, true)).done(function(data) {
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
 * @param      {<type>}  modalType  The modal type
 */
OpenCustomModal = (modalName,extention,modalType) => {
  var model = "./modals/" + modalName + "." + extention;
  $('.modal-dialog').removeClass('modal-xl').removeClass('modal-lg').removeClass('modal-sm').removeClass('modal-xs');
  $('.modal-dialog').addClass(modalType);
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

/**
 * Gets the url parameter.
 *
 * @param      {string}  name    The name
 */
function getUrlParameter(name) {
    name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
    var results = regex.exec(location.search);
    return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
};

/**
 * { function_description }
 *
 * @param      {<type>}  query   The query
 * @return     {Object}  { description_of_the_return_value }
 */
executeCustomQuery = (query,type) => {
  $.when(Posthandler("/aeroticInvoice/api/custom/custom_query.php", {'query':query}, false)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
     if(type.trim().toLowerCase() === "login"){
       updateLoginGraphicLayout(res.data,type);
     } else if(type.trim().toLowerCase() === "logout")  {
       updateLogoutGraphicLayout(res.data,type);
     }
    }
  }).fail(function() {
    return {"resCode":"Error","message":"Something went wrong please contact your administrator."};
  });
}


/**
 * { function_description }
 */
function allGraphicalViewUpdate(){
  var user = localStorage.getItem('user');
  if(user){
    user = JSON.parse(user);
    executeCustomQuery("select count(*) as y,CAST(created_at AS DATE) as x from logs where  type='login' and info='" + user.userid + "' GROUP BY CAST(created_at AS DATE);","login");
    executeCustomQuery("select count(*) as y,CAST(created_at AS DATE) as x from logs where  type='logout' and info='" + user.userid + "' GROUP BY CAST(created_at AS DATE);","logout");
  }
}

/**
 * { function_description }
 *
 * @param      {<type>}  data    The data
 */
updateLoginGraphicLayout = (data) => {
  var xAxes = [];
  var yAxes = [];
  var backgroundColor = [];
  var borderColor = [];
  data.forEach(ele => {
    xAxes.push(ele['x']);
    yAxes.push(ele['y']);
    backgroundColor.push(getRandomColor());
    borderColor.push(getRandomColor());
  })
  var ctx = document.getElementById("viewGraphicalRepresentationLoginChart");
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: xAxes,
      datasets: [{
        label: 'Number of times in a day',
        data: yAxes,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderWidth: 1
      }]
    },
    options: {
      responsive: false,
      scales: {
        xAxes: [{
          ticks: {
            maxRotation: 90,
            minRotation: 0
          }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      showDatapoints: true,
    }
  });
}

/**
 * { function_description }
 *
 * @param      {<type>}  data    The data
 */
updateLogoutGraphicLayout = (data) => {
  console.log("updateLogoutGraphicLayout : ",data);
  var xAxes = [];
  var yAxes = [];
  var backgroundColor = [];
  var borderColor = [];
  data.forEach(ele => {
    xAxes.push(ele['x']);
    yAxes.push(ele['y']);
    backgroundColor.push(getRandomColor());
    borderColor.push(getRandomColor());
  })
  var ctx = document.getElementById("viewGraphicalRepresentationLogoutChart");
  var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: xAxes,
      datasets: [{
        label: 'Number of times in a day',
        data: yAxes,
        backgroundColor: backgroundColor,
        borderColor: borderColor,
        borderWidth: 1
      }]
    },
    options: {
      responsive: false,
      scales: {
        xAxes: [{
          ticks: {
            maxRotation: 90,
            minRotation: 0
          }
        }],
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      },
      showDatapoints: true,
    }
  });
}

/**
 * Gets the random color.
 *
 * @return     {string}  The random color.
 */
getRandomColor = () => {
    var letters = '0123456789ABCDEF'.split('');
    var color = '#';
    for (var i = 0; i < 6; i++ ) {
        color += letters[Math.floor(Math.random() * 16)];
    }
    return color;
}


/**
 * { function_description }
 *
 * @param      {<type>}   e       { parameter_description }
 * @return     {boolean}  { description_of_the_return_value }
 */
function viewGraphicalRepresentationFunction(ele,e){
  e.preventDefault();
  var checkHide = $("#viewGraphicalRepresentation").hasClass("hide");
  if(checkHide){
    $('.viewGraphicalRepresentation').removeClass('hide')
    $('.graphicVieButton').html('Hide Graphical Representation');
  }else{
    $('.viewGraphicalRepresentation').addClass('hide')
    $('.graphicVieButton').html('Show Graphical Representation');
  }
}