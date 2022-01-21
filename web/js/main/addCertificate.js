$(document).ready(function() {
  $.validator.addMethod("latersAndNumbers", function(value, element) {
        return this.optional(element) || /^[A-Za-z0-9\ -]+$/i.test(value);
    }, "Username must contain only letters, numbers, or dashes.");
  jQuery.validator.addMethod("lettersonly", function(value, element) {
    return this.optional(element) || /^[a-zA-Z ]+$/i.test(value);
  }); 
  jQuery.validator.addMethod("specialChars", function( value, element ) {
    var regex = new RegExp("^[a-zA-Z0-9]+$");
    var key = value;

    if (!regex.test(key)) {
       return false;
    }
    return true;
  });
  var today = new Date();
  $("#date").val(moment(today).format('DD-MM-YYYY'));
  
  $("#registrationForm").validate({
    // Specify validation rules
    rules: {
        owner_name: {
            required:true,
            lettersonly:true
        },
        mobile: {
            required:true,
            number:true,
            minlength: 10,
            maxlength: 15
        },
        address1: {
            required:true,
            latersAndNumbers:true,
        },
        technician_name: {
            required:true,
            lettersonly:true
        },
        vehicle: {
            required:true,
            latersAndNumbers:true
        },
        engine: {
            required:true,
            latersAndNumbers:true
        },
        chassi: {
            required:true,
            latersAndNumbers:true
        },
        manufacturer: {
            required:true,
            lettersonly:true
        },
        maker_classification: {
            required:true,
            lettersonly:true
        },
        registration_date: {
            required:true
        },
        speed: {
            required:true,
            latersAndNumbers:true
        },
        installation_date: {
            required:true
        },
        roto: {
            required:true,
            latersAndNumbers:true
        },
        invoice_no: {
            required:true,
            latersAndNumbers:true
        },
      },
      // Specify validation error messages
      messages: {
        owner_name: {
            required:"Please enter your Owner Name",
            lettersonly:"Name will be alphabetic letters only"
        },
        mobile: {
            required: "Please enter your Mobile Number",
            number: "Please enter valid Mobile Number",
            minlength: "Your password must be at least 5 characters long",
            maxlength: "Your password must be at most 10 characters long"
        },
        address1: {
            required:"Please enter your Address",
            latersAndNumbers:"Address will be alphabetic and numbers only",
        },
        technician_name: {
            required:"Please enter your Technician Name ",
            lettersonly:"Enter a valid Technician Name "
        },
        vehicle: {
            required:"Please enter your any Vehicle Number",
            latersAndNumbers: "Vehicle Number will be alphabetic and numbers only"
        },
        engine: {
            required:"Please enter your Engine Number",
            latersAndNumbers: "Engine Number will be alphabetic and numbers only"
        },
        chassi: {
            required:"Please enter your Chassi Number",
            latersAndNumbers: "Chassi Number will be alphabetic and numbers only"
        },
        manufacturer: {
            required:"Please enter your Manufacturer",
            lettersonly: "Enter a valid manufacturer"
        },
        maker_classification: {
            required:"Please enter your Maker Classification ",
            lettersonly: "Enter a valid maker classification"
        },
        registration_date: {
            required:"Please enter your Registration Date "
        },
        speed: {
            required:"Please enter your Speed",
            latersAndNumbers: "Speed will be alphabetic and numbers only"
        },
        installation_date: {
            required:"Please enter your Installation Date"
        },
        roto: {
            required:"Please enter your Roto Seal/Ref No",
            latersAndNumbers: "Roto Seal/Ref No will be alphabetic and numbers only"
        },
        invoice_no: {
            required:"Please enter your Invoice No",
            latersAndNumbers: "Invoice No will be alphabetic and numbers only"
        },
      },
      // Make sure the form is submitted to the destination defined
      // in the "action" attribute of the form when valid
      submitHandler: function(form) {
        formSubmitFunction();
      }
  });
 
});
 function formSubmitFunction(){
    // e.preventDefault();
    var ownername = $('#owner_name').val();
    var mobile = $('#mobile').val();
    var address1 = $('#address1').val();
    var technicianname = $('#technician_name').val();
    var vehicle = $('#vehicle').val();
    var engine = $('#engine').val();
    var chassi = $('#chassi').val();
    var manufacturer = $('#manufacturer').val();
    var makerclassification = $('#maker_classification').val();
    var registrationdate = $('#registration_date').val();
    var speed = $('#speed').val();
    var installationdate = $('#installation_date').val();
    var roto = $('#roto').val();
    var invoiceno = $('#invoice_no').val();
    var obj = {
      "ownername": ownername,
      "mobile": mobile,
      "address1": address1,
      "technicianname": technicianname,
      "vehicle": vehicle,
      "engine": engine,
      "chassi": chassi,
      "manufacturer": manufacturer,
      "makerclassification": makerclassification,
      "registrationdate": registrationdate,
      "speed": speed,
      "installationdate": installationdate,
      "roto": roto,
      "invoiceno": invoiceno
    }
    // console.log(obj,'-----------------');
    $.ajax({
        type: "POST",
        url: './../../api/certificate/addCertificate.php',
        data: JSON.stringify(obj),
        contentType: "application/json",
        dataType: "json",
        success: function(data) {
            if (data.resCode.trim().toLowerCase() == "ok") {
                $.notify(data.Message, "success");
                $('#errorDiv').html(data.Message);
                // setTimeout(()=>{
                //     location.href = './login.html';
                // },250);
            } else {
                $('#errorDiv').html(data.Message);
                $.notify(data.Message, "error");
            }
        },
        error: function(err) {
            $('#errorDiv').html("Something went wrong please contact your administrator.");
        }
    })
  }