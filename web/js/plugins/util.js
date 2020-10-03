/**
 * { function_description }
 */
logoutFunction = () => {
  var user = localStorage.getItem('user');
  if(user)user=JSON.parse(user);
  if(user){
    $.when(Posthandler("./../api/user/user_logout.php", {userid:user.userid}, true)).done(function(data) {
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
  }	else{
    setTimeout(()=>{
      location.href = '/';
    },150);
  }
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
      $.when(Posthandler("./../../api/custom/custom_query.php", {'query':query, 'token': user.token}, true)).done(function(res) {
        if(res.resCode.trim().toLowerCase() == "ok") {
          $.notify(res.message, "success");          
          setTimeout(()=>{
            updateUserDetailsHtml(user.userid);
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
  $.when(Posthandler("./../api/user/user_details.php", {"userid":userid}, true)).done(function(res) {
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
 * @param      {<type>}  userid  The userid
 */
updateUserDetailsHtml = (userid) => {
  $.when(Posthandler("./../../api/user/user_details.php", {"userid":userid}, true)).done(function(res) {
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
executeCustomQuery = (query,type,view = "",message = "") => {
  var user = JSON.parse(localStorage.getItem('user'));
  $.when(Posthandler("./../api/custom/custom_query.php", {'query':query, 'token': user.token}, false)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
     if(type.trim().toLowerCase() === "login"){
       updateLoginGraphicLayout(res.data,type);
     } else if(type.trim().toLowerCase() === "logout") {
       updateLogoutGraphicLayout(res.data,type);
     } else if(type.trim().toLowerCase() === "maincontainerbody"){
       if(res.data.length > 0){
        globalObj.data = res.data;
        globalObj.type = type;
        globalObj.view = view;
        updateMainContainerBody(res.data,type,view);
       }
       else{
        $.notify("Data not found","error");
        updateMainContainerBodyWithOutData(res.data,type,view);
       }
     } else if(type.trim().toLowerCase() === "directrun"){
       if(message != ""){
         $.notify(message,"success");
       }else{
         $.notify(res.message,"success");
       }
     } else if(type.trim().toLowerCase() === "updatecounters"){
       $('.' + view).html(res.data[0]["count"])
     } else if(type.trim().toLowerCase() === "updatebasics"){
       // $('.' + view).html(res.data[0]["count"])
       $("#selfName").html(res.data[0]["Name"]);
       $("#selfAddress").html(res.data[0]["Address"]);
       $("#selfPhone").html(res.data[0]["Phone"]);
       $("#selfGst").html(res.data[0]["Gst"]);
       $("#registrationNumber").html(res.data[0]["HsnCode"]);
       let invoiceNumber = ``;
       if(parseInt(parseInt(res.data[0]["InvoiceCount"])) > 99) {
         invoiceNumber = `${parseInt(res.data[0]["InvoiceCount"])}`; 
       } else if(parseInt(res.data[0]["InvoiceCount"]) > 9) {
         invoiceNumber = `0${parseInt(res.data[0]["InvoiceCount"])}`;
       }  else invoiceNumber = `00${parseInt(res.data[0]["InvoiceCount"])}`;
       invoiceNumber = invoiceNumber + `/${res.data[0]["YearCode"]}`;
       console.log('invoiceNumber : ',invoiceNumber);
       $("#invoiceNumber").html(invoiceNumber);
     } else if(type.trim().toLowerCase() === "updateinvoiceitems"){
       updateInvoiceItems(res.data,type,view,message);
     }
    } else if(res.resCode.trim().toLowerCase() == "sessionerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    } else if(res.resCode.trim().toLowerCase() == "tokenerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    }else {
      $.notify(res.message,"error");
    }
  }).fail(function() {
    return {"resCode":"Error","message":"Something went wrong please contact your administrator."};
  });
}

/**
 * { function_description }
 *
 * @param      {<type>}  query   The query
 * @return     {Object}  { description_of_the_return_value }
 */
executeCustomQueryHtml = (query,type,view = "",message = "") => {
  var user = JSON.parse(localStorage.getItem('user'));
  $.when(Posthandler("./../../api/custom/custom_query.php", {'query':query, 'token': user.token}, false)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
     if(type.trim().toLowerCase() === "login"){
       updateLoginGraphicLayout(res.data,type);
     } else if(type.trim().toLowerCase() === "logout") {
       updateLogoutGraphicLayout(res.data,type);
     } else if(type.trim().toLowerCase() === "maincontainerbody"){
       if(res.data.length > 0){
        globalObj.data = res.data;
        globalObj.type = type;
        globalObj.view = view;
        updateMainContainerBody(res.data,type,view);
       }
       else{
        $.notify("Data not found","error");
        updateMainContainerBodyWithOutData(res.data,type,view);
       }
     } else if(type.trim().toLowerCase() === "directrun"){
       if(message != ""){
         $.notify(message,"success");
       }else{
         $.notify(res.message,"success");
       }
     } else if(type.trim().toLowerCase() === "updatecounters"){
       $('.' + view).html(res.data[0]["count"])
     } else if(type.trim().toLowerCase() === "updatebasics"){
       // $('.' + view).html(res.data[0]["count"])
       $("#selfName").html(res.data[0]["Name"]);
       $("#selfAddress").html(res.data[0]["Address"]);
       $("#selfPhone").html(res.data[0]["Phone"]);
       $("#selfGst").html(res.data[0]["Gst"]);
       $("#registrationNumber").html(res.data[0]["HsnCode"]);
       let invoiceNumber = ``;
       if(parseInt(parseInt(res.data[0]["InvoiceCount"])) > 99) {
         invoiceNumber = `${parseInt(res.data[0]["InvoiceCount"])}`; 
       } else if(parseInt(res.data[0]["InvoiceCount"]) > 9) {
         invoiceNumber = `0${parseInt(res.data[0]["InvoiceCount"])}`;
       }  else invoiceNumber = `00${parseInt(res.data[0]["InvoiceCount"])}`;
       invoiceNumber = invoiceNumber + `/${res.data[0]["YearCode"]}`;
       console.log('invoiceNumber : ',invoiceNumber);
       $("#invoiceNumber").html(invoiceNumber);
     } else if(type.trim().toLowerCase() === "updateinvoicenumber"){
       $("#invoiceNumber").html(parseInt(res.data[0]["invoiceNumber"]) + 1);
     } else if(type.trim().toLowerCase() === "updateinvoiceitems"){
       updateInvoiceItems(res.data,type,view,message);
     }
    } else if(res.resCode.trim().toLowerCase() == "sessionerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    } else if(res.resCode.trim().toLowerCase() == "tokenerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    }else {
      $.notify(res.message,"error");
    }
  }).fail(function() {
    return {"resCode":"Error","message":"Something went wrong please contact your administrator."};
  });
}

updateInvoiceItems = (data,type,view,message) => {
  var body = '';
  data.forEach((items) => {
    body += `<tr class='item-row'>
              <td class='item-name'>
                <div class='delete-wpr'><textarea id='Name'>${items['name']}</textarea><a class='delete' href='javascript:;' title='Remove row'><i class='fa fa-times' aria-hidden='true'></i></a>
                </div>
              </td>
              <td class='description'><textarea id='Type'>${items['detail']}</textarea></td>
              <td><textarea class='cost'>${items['rate']}</textarea></td>
              <td class='qtyDiv'><textarea class='qty'></textarea></td>
              <td><i class='fa fa-inr'></i> <span class='price'></span></td>
            </tr>";`
  });
  body += `<tr id="hiderow" class="hiderow">
            <td colspan="5"><a id="addrow" href="javascript:;" title="Add a row"><i class='fa fa-plus' aria-hidden='true'></i>Add a row</a></td>
          </tr>`;
  $('#' + view).html(body);
  // $(".qty").html(1);
  // $('.qtyDiv').find('textarea').first().focus();
}

showServerSideDetailsByTableNameDataTable = (table_name,type,veiw = "")=> {
  if(type.trim().toLowerCase() === "maincontainerbody"){
    updateMainContainerBodyDataTable(table_name,type,veiw);
  }
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

var globalObj = {}
/**
 * { function_description }
 *
 * @param      {<type>}  data    The data
 * @param      {<type>}  type    The type
 * @param      {<type>}  view    The view
 */
updateMainContainerBody = (data,type,view) => {
  if(view.trim().toLowerCase() === "basicdetails"){
    $('.' + type).html("").append(`<table id='${type + 'Table'}' class='table table-bordered table-striped' cellspacing=0 width=100%></table><br/><br/><button class="btn btn-primary" type="button" onclick="editMainContainerBody();">Edit</button>`);
    var body = "";
    data = data[0];
    for(var key in data){
      let updatedKey = updateKeyFormat(key);
      if(data[key] == null || data[key] == undefined)data[key] = '';
      body += "<tr><th class='capitalize' style='width:50%;'>" + updatedKey + "</th><td style='width:50%;'>" + data[key] + "</td></tr>";
    }
    $("#" + type + 'Table').append(body);
  }
}

/**
 * { function_description }
 *
 * @param      {<type>}  table_name  The table name
 * @param      {string}  type        The type
 * @param      {string}  view        The view
 */
updateMainContainerBodyDataTable = (table_name,type,view) => {
  // if(view.trim().toLowerCase() === "productdetails"){
  //   $('.' + type).html("").append(`<table id='exampleEditable' class='table table-bordered table-striped' cellspacing=0 width=100%><thead><tr><th>ID</th><th>Name</th><th>Detail</th><th>Rate</th><th>Created At</th><th>Updated At</th><th>Updated By</th><th>Action</th></tr></thead></table>`);
  //   updateDataTableWithServerSidePagination('exampleEditable','./../api/datatable/product_details.php',true,table_name);    
  // } else if (view.trim().toLowerCase() === "invoicesdetails"){
  //   $('.' + type).html("").append(`<table id='exampleEditable' class='table table-bordered table-striped' cellspacing=0 width=100%><thead><tr><th>Invoice ID</th><th>Invoice Date</th><th>Sub Total</th><th>GST</th><th>Total</th><th>Paid</th><th>Due</th><th>Created At</th><th>Updated At</th><th>Updated By</th><th>Action</th></tr></thead></table>`);
  //   updateDataTableWithServerSidePagination('exampleEditable','./../api/datatable/invoices_details.php',true,table_name);
  // }
  if(view.trim().toLowerCase() === "productdetails"){
    $('.' + type).html("").append(`<table id='exampleEditable' class='table table-bordered table-striped' cellspacing=0 width=100%><thead><tr><th>ID</th><th>Name</th><th>Detail</th><th>Rate</th><th>Created At</th><th>Updated At</th><th>Updated By</th><th>Action</th></tr></thead></table>`);
    updateDataTableWithoutServerSidePagination('exampleEditable','./../api/datatable/product_details.php',true,table_name);    
  } else if (view.trim().toLowerCase() === "invoicesdetails"){
    $('.' + type).html("").append(`<table id='exampleEditable' class='table table-bordered table-striped' cellspacing=0 width=100%><thead><tr><th>Invoice ID</th><th>Invoice Date</th><th>Sub Total</th><th>GST</th><th>Total</th><th>Paid</th><th>Due</th><th>Created At</th><th>Updated At</th><th>Updated By</th><th>Action</th></tr></thead></table>`);
    updateDataTableWithoutServerSidePagination('exampleEditable','./../api/datatable/invoices_details.php',true,table_name);
  }
}

/**
 * { function_description }
 *
 * @param      {string}  id      The identifier
 * @param      {<type>}  url     The url
 */
updateDataTableWithServerSidePagination =  (id,url,action,table_name) => {
  console.log("id : ",id);
  console.log("url : ",url);
  console.log("action : ",action);
  console.log("table_name : ",table_name);
  if(action){
    $.fn.dataTable.ext.buttons.add = {
      className: 'add-record',
      action: function ( e, dt, node, config ) {
        globalObj.editTableName = table_name;
        delete globalObj.editId;
        OpenCustomModal('editModal','html','modal-lg');
      }
    };
    $('#' + id).DataTable({
      dom: 'Blfrtip',
      buttons: [
        'copy', 'csv', 'excel', 'pdf', 'print',{extend: 'add',text: 'Add New'}
      ],
      searching: true,
      aLengthMenu: [
          [5, 10, 50, 100, -1],
          [5, 10, 50, 100, "All"]
      ],
      iDisplayLength: 5,
      "processing": true,
      "serverSide": true,
      "ajax": url,
      createdRow: function(row, data, index) {
          // $(row).find('td').eq(0).addClass(index + 'noisref');
          // $(row).find('td').eq(1).addClass('getRowWiseData');
          var addHtml = ``;
          if(table_name === "product"){
            addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-edit'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
          } else if(table_name === "invoices"){
            addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-eye'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
          }
          $(row).find('td:last').html(addHtml);
      },
      "scrollX": true,
      "autoWidth": true
    });
  }else{
    $('#' + id).DataTable({
      dom: 'Blfrtip',
      buttons: [
          'copy', 'excel', 'pdf', 'print'
      ],
      searching: true,
      aLengthMenu: [
          [5, 10, 50, 100, -1],
          [5, 10, 50, 100, "All"]
      ],
      iDisplayLength: 5,
      "processing": true,
      "serverSide": true,
      "ajax": url,
      "scrollX": true,
      "autoWidth": true
    });
  }
}

/**
 * { function_description }
 *
 * @param      {string}  id      The identifier
 * @param      {<type>}  url     The url
 */
updateDataTableWithoutServerSidePagination = (id,url,action,table_name) => {
  let columns = [];
  console.log("id : ",id);
  console.log("url : ",url);
  console.log("action : ",action);
  console.log("table_name : ",table_name);
  let query = `select * from ${table_name}`;
  if (table_name === "invoices") {
    columns = [
      { data: 'id' },
      { data: 'invoice_date' },
      { data: 'subtotal' },
      { data: 'gst' },
      { data: 'total' },
      { data: 'paid' },
      { data: 'due' },
      { data: 'created_at' },
      { data: 'updated_at' },
      { data: 'updated_by' },
      { data: 'updated_by' }
    ]
  } else if (table_name === "product") {
    columns = [
      { data: 'id' },
      { data: 'name' },
      { data: 'detail' },
      { data: 'rate' },
      { data: 'created_at' },
      { data: 'updated_at' },
      { data: 'updated_by' },
      { data: 'updated_by' }
    ]
  }
  $.when(Posthandler("./../api/custom/custom_query.php", {'query':query, 'token': user.token}, false)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
      if(action){
        $.fn.dataTable.ext.buttons.add = {
          className: 'add-record',
          action: function ( e, dt, node, config ) {
            globalObj.editTableName = table_name;
            delete globalObj.editId;
            OpenCustomModal('editModal','html','modal-lg');
          }
        };
        $('#' + id).DataTable({
          dom: 'Blfrtip',
          buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print' //,{extend: 'add',text: 'Add New'}
          ],
          searching: true,
          aLengthMenu: [
              [5, 10, 50, 100, -1],
              [5, 10, 50, 100, "All"]
          ],
          iDisplayLength: 5,
          // "processing": true,
          // "serverSide": true,
          // "ajax": url,
          data: res.data,
          columns: columns,
          responsive: true,
          createdRow: function(row, data, index) {
              // $(row).find('td').eq(0).addClass(index + 'noisref');
              // $(row).find('td').eq(1).addClass('getRowWiseData');
              var addHtml = ``;
              if(table_name === "product"){
                addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-edit'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
              } else if(table_name === "invoices"){
                addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-eye'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
              }
              $(row).find('td:last').html(addHtml);
          },
          // "scrollX": true,
          // "autoWidth": true
        });
      }else{
        $('#' + id).DataTable({
          data: res.data,
          columns: columns,
          dom: 'Blfrtip',
          buttons: [
            'copy', 'excel', 'pdf', 'print'
          ],
          searching: true,
          aLengthMenu: [
              [5, 10, 50, 100, -1],
              [5, 10, 50, 100, "All"]
          ],
          iDisplayLength: 5,
          responsive: true,
          // "processing": true,
          // "serverSide": true,
          // "ajax": url,
          // "scrollX": true,
          // "autoWidth": true,

        });
      }
    } else if(res.resCode.trim().toLowerCase() == "sessionerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    } else if(res.resCode.trim().toLowerCase() == "tokenerror") {
      $.notify(res.message,"error");
      setTimeout(()=> { logoutFunction(); },200);
    }else {
      $.notify(res.message,"error");
    }
  }).fail(function() {
    return {"resCode":"Error","message":"Something went wrong please contact your administrator."};
  });
  // if(action){
  //   $.fn.dataTable.ext.buttons.add = {
  //     className: 'add-record',
  //     action: function ( e, dt, node, config ) {
  //       globalObj.editTableName = table_name;
  //       delete globalObj.editId;
  //       OpenCustomModal('editModal','html','modal-lg');
  //     }
  //   };
  //   $('#' + id).DataTable({
  //     dom: 'Blfrtip',
  //     buttons: [
  //       'copy', 'csv', 'excel', 'pdf', 'print',{extend: 'add',text: 'Add New'}
  //     ],
  //     searching: true,
  //     aLengthMenu: [
  //         [5, 10, 50, 100, -1],
  //         [5, 10, 50, 100, "All"]
  //     ],
  //     iDisplayLength: 5,
  //     "processing": true,
  //     "serverSide": true,
  //     "ajax": url,
  //     createdRow: function(row, data, index) {
  //         // $(row).find('td').eq(0).addClass(index + 'noisref');
  //         // $(row).find('td').eq(1).addClass('getRowWiseData');
  //         var addHtml = ``;
  //         if(table_name === "product"){
  //           addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-edit'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
  //         } else if(table_name === "invoices"){
  //           addHtml += `<a href='javascript:;' class='edit' onclick='EditData(this,"${table_name}")'><i class='far fa-eye'></i></a> | <a href='javascript:;' class='delete' onclick='DeleteData(this,"${table_name}")'><i class='far fa-trash-alt'></i></a>`;
  //         }
  //         $(row).find('td:last').html(addHtml);
  //     },
  //     "scrollX": true,
  //     "autoWidth": true
  //   });
  // }else{
  //   $('#' + id).DataTable({
  //     dom: 'Blfrtip',
  //     buttons: [
  //         'copy', 'excel', 'pdf', 'print'
  //     ],
  //     searching: true,
  //     aLengthMenu: [
  //         [5, 10, 50, 100, -1],
  //         [5, 10, 50, 100, "All"]
  //     ],
  //     iDisplayLength: 5,
  //     "processing": true,
  //     "serverSide": true,
  //     "ajax": url,
  //     "scrollX": true,
  //     "autoWidth": true
  //   });
  // }
}

/**
 * { Edit Data }
 *
 * @class      EditData (name)
 * @param      {<type>}  val         The value
 * @param      {<type>}  table_name  The table name
 */
EditData = (val,table_name) => {
  var Id = $(val).parents('tr').find('td:first').html();
  globalObj.editId = Id;
  globalObj.editTableName = table_name;
  var action;
  if(table_name.trim().toLowerCase() === "product"){
    action = 'edit';
  }else if(table_name.trim().toLowerCase() === "invoices"){
    action = 'view';
  }
  swal({
    title: "Are you sure?",
    text: `You want to ${action} record having id ${Id}`,
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((isConfirm) => {
    if (isConfirm) {      
      if(table_name.trim().toLowerCase() === "product"){
        OpenCustomModal('editModal','html','modal-lg');
      }else if(table_name.trim().toLowerCase() === "invoices"){
        window.open(`./html/viewInvoice.html?id=${Id}`, "_blank")
      }      
    } else {
      $.notify("Your details are safe!", "info");
    }
  });
}

/**
 * { Delete Data }
 *
 * @class      DeleteData (name)
 * @param      {<type>}  val         The value
 * @param      {<type>}  table_name  The table name
 */
DeleteData = (val,table_name) => {
  var Id = $(val).parents('tr').find('td:first').html();
  swal({
    title: "Are you sure?",
    text: `You want to delete this record having id ${Id}`,
    icon: "warning",
    buttons: true,
    dangerMode: true,
  }).then((isConfirm) => {
    if (isConfirm) {
      var query = `delete from ${table_name} where id=${Id};`;
      executeCustomQuery(query,"directrun","","Record has been deleted");
      updateCounters();
      if(table_name === "product"){
        productDetails();
      } else if (table_name === "invoices"){
        viewBill();
      }
    } else {
      $.notify("Your details are safe!", "info");
    }
  });
}

/**
 * { edit Main Container Body }
 */
editMainContainerBody = () => {
  if(globalObj.view.trim().toLowerCase() === "basicdetails"){
    $('.' + globalObj.type).html("").append(`<table id='${globalObj.type + 'Table'}' class='table table-bordered table-striped' cellspacing=0 width=100%></table><br/><br/><button class="btn btn-primary" type="button" onclick="saveEditedMainContainerBody();">Save</button>`);
    var body = "";
    data = globalObj.data[0];
    var allEditFieldKey = [];
    delete data.updated_at;
    delete data.updated_by;
    for(var key in data){
      let updatedKey = updateKeyFormat(key);
      if(data[key] == null || data[key] == undefined)data[key] = '';
      body += "<tr><th class='capitalize' style='width:50%;'>" + updatedKey + "</th><td style='width:50%;'><input type='text' id='" + key + "' value='" + data[key] + "'/></td></tr>";
      allEditFieldKey.push(key);
    }
    globalObj.allEditFieldKey = allEditFieldKey;
    $("#" + globalObj.type + 'Table').append(body);
  }
}

/**
 * Saves an edited main container body.
 */
saveEditedMainContainerBody = () => {
  var query = 'update ';
  var user = localStorage.getItem('user');
  if(user){
    user = JSON.parse(user);
  }
  if(globalObj.view.trim().toLowerCase() === "basicdetails"){
    query += "basic SET "
  }
  globalObj.allEditFieldKey.forEach(key => {
    query += key + "='" + $('#'+ key).val() + "', "
  })
  // query = query.slice(0, -1);
  query += `updated_by="${user.id}"`;
  $.when(Posthandler("./../api/custom/custom_query.php", {'query':query, 'token': user.token}, true)).done(function(res) {
    if(res.resCode.trim().toLowerCase() == "ok") {
      $.notify(res.message, "success");          
      setTimeout(()=>{
        if(globalObj.view.trim().toLowerCase() === "basicdetails"){
          basicDetails();
        }
      },100);
    } else {
      $('#errorDiv').html(res.message);
      $.notify(res.message, "error");
    }
  }).fail(function() {
    $.notify("Something went wrong please contact your administrator.", "error");
    console.log("Error executing AJAX request. Please contact your administrator");
  });
}

updateMainContainerBodyWithOutData = (data,type,view) => {
  $('.' + type).html("");
}

/**
 * Shows the loader.
 */
showLoader = async () => {
  setTimeout(() => {
    $('.loader').removeClass("hide");
    $('.bodycontainer').addClass("hide");
  }, 2000);
}

/**
 * Hides the loader.
 */
hideLoader = async () => {
  setTimeout(() => {
    $('.loader').addClass("hide");
    $('.bodycontainer').removeClass("hide");
    $('.bodycontainer').css({
      'height': '100%',
      'overflow-y': 'scroll'
    })
  }, 2000);
}