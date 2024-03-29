let puc_global = {
    isTestPass: false,
    test_password: "12345",
    test_result: []
}

$(document).ready(function () {
    $.validator.addMethod("latersAndNumbers", function (value, element) {
        return this.optional(element) || /^[A-Za-z0-9\ -]+$/i.test(value);
    }, "Username must contain only letters, numbers, or dashes.");
    jQuery.validator.addMethod("lettersonly", function (value, element) {
        return this.optional(element) || /^[a-zA-Z ]+$/i.test(value);
    });
    jQuery.validator.addMethod("specialChars", function (value, element) {
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
            state: {
                required: true,
            },
            rto_code: {
                required: true,
            },
            district: {
                required: true,
            },
            owner_name: {
                required: true,
                lettersonly: true
            },
            mobile: {
                required: true,
                number: true,
                minlength: 10,
                maxlength: 15
            },
            address1: {
                required: true,
                latersAndNumbers: true,
            },
            technician_name: {
                required: true,
                lettersonly: true
            },
            vehicle: {
                required: true,
                latersAndNumbers: true
            },
            engine: {
                required: true,
                latersAndNumbers: true
            },
            chassi: {
                required: true,
                latersAndNumbers: true
            },
            vehicle_class: {
                required: true,
            },
            vehicle_model: {
                required: true,
            },
            fuel_type: {
                required: true,
            },
            vehicle_norms: {
                required: true,
            },
            test_fees: {
                required: true,
            },
            manufacturer: {
                required: true,
                lettersonly: true
            },
            maker_classification: {
                required: true,
                lettersonly: true
            },
            registration_date: {
                required: true
            },
            // speed: {
            //     required:true,
            // },
            // installation_date: {
            //     required:true
            // },
            validity: {
                required: true
            },
            // roto: {
            //     required:true,
            //     latersAndNumbers:true
            // },
            invoice_no: {
                required: true,
                latersAndNumbers: true
            },
        },
        // Specify validation error messages
        messages: {
            state: {
                required: "Please enter your State"
            },
            rto_code: {
                required: "Please enter your rto_code"
            },
            district: {
                required: "Please enter your district"
            },
            owner_name: {
                required: "Please enter your Owner Name",
                lettersonly: "Name will be alphabetic letters only"
            },
            mobile: {
                required: "Please enter your Mobile Number",
                number: "Please enter valid Mobile Number",
                minlength: "Your password must be at least 5 characters long",
                maxlength: "Your password must be at most 10 characters long"
            },
            address1: {
                required: "Please enter your Address",
                latersAndNumbers: "Address will be alphabetic and numbers only",
            },
            technician_name: {
                required: "Please enter your Technician Name ",
                lettersonly: "Enter a valid Technician Name "
            },
            vehicle: {
                required: "Please enter your any Vehicle Number",
                latersAndNumbers: "Vehicle Number will be alphabetic and numbers only"
            },
            engine: {
                required: "Please enter your Engine Number",
                latersAndNumbers: "Engine Number will be alphabetic and numbers only"
            },
            chassi: {
                required: "Please enter your Chassi Number",
                latersAndNumbers: "Chassi Number will be alphabetic and numbers only"
            },
            vehicle_class: {
                required: "Please enter your vehicle_class"
            },
            vehicle_model: {
                required: "Please enter your vehicle_model"
            },
            fuel_type: {
                required: "Please enter your vehicle_norms"
            },
            vehicle_norms: {
                required: "Please enter your vehicle_norms"
            },
            test_fees: {
                required: "Please enter your test_fees"
            },
            manufacturer: {
                required: "Please enter your Manufacturer",
                lettersonly: "Enter a valid manufacturer"
            },
            maker_classification: {
                required: "Please enter your Maker Classification ",
                lettersonly: "Enter a valid maker classification"
            },
            registration_date: {
                required: "Please enter your Registration Date "
            },
            // speed: {
            //     required:"Please enter your Speed"
            // },
            // installation_date: {
            //     required:"Please enter your Installation Date"
            // },
            validity: {
                required: "Please enter your  valid details"
            },
            // roto: {
            //     required:"Please enter your Roto Seal/Ref No",
            //     latersAndNumbers: "Roto Seal/Ref No will be alphabetic and numbers only"
            // },
            invoice_no: {
                required: "Please enter your Invoice No",
                latersAndNumbers: "Invoice No will be alphabetic and numbers only"
            },
        },
        // Make sure the form is submitted to the destination defined
        // in the "action" attribute of the form when valid
        submitHandler: function (form) {
            formSubmitFunction();
        }
    });
    updateRtoCodeHandler();
    $('#rto_code').on('change', function () {
        let rtoCode = this.value;
        let selectedRtoCodeDetails = rtoDetails.find(item => item.value === rtoCode);
        $("#district").val(selectedRtoCodeDetails.name);
    });
});

let fileData;

const showLoader = () => {
    $('.loader').removeClass('hide');
    $('.bodycontainer').addClass('hide');
}

const hideLoader = () => {
    $('.loader').addClass('hide');
    $('.bodycontainer').removeClass('hide');
}

function getTestResult(event, type = "main") {
    event.preventDefault();
    var test_password = $('#test_password').val();
    if (!test_password) {
        $.notify('Please enter your PUC Test Password', "error");
    } else {
        if (test_password === puc_global.test_password) {
            puc_global.isTestPass = true;
            var fueltype = $('#fuel_type').val();
            var vehicleClass = $('#vehicle_class').val();
            if (fueltype && vehicleClass) {
                showLoader();
                if (fueltype.trim().toLowerCase().includes('petrol')) {
                    let finalFilterArray = [];
                    // petrol settings            
                    // to gerate a randome rounded number between 1 to 10;
                    if (vehicleClass.trim().toLowerCase() === "mc") finalFilterArray = petrolPuc.filter(item => item.wheels === 2);
                    else if (vehicleClass.trim().toLowerCase() === "auto") finalFilterArray = petrolPuc.filter(item => item.wheels === 3);
                    else if (vehicleClass.trim().toLowerCase() !== "auto") finalFilterArray = petrolPuc.filter(item => item.wheels === 4);
                    var theRandomNumber = Math.floor(Math.random() * 10) + 1;
                    const currentSet = finalFilterArray[theRandomNumber];
                    if (type === "main") puc_global.test_result = [currentSet]
                    else puc_global.test_result.push(currentSet);
                } else {
                    // Deisel settings
                    // to gerate a randome rounded number between 1 to 10;
                    var theRandomNumber = Math.floor(Math.random() * 10) + 1;
                    const currentSet = dieselPuc[theRandomNumber];
                    if (type === "main") puc_global.test_result = [currentSet]
                    else puc_global.test_result.push(currentSet);
                }
                setTimeout(() => {
                    hideLoader();
                    updatePUCResultContainer();
                    if (!fueltype.trim().toLowerCase().includes('petrol')) {
                        $('.test_more_button').prop( "disabled", false );
                    } else {
                        $('.test_more_button').prop( "disabled", true );
                    }
                }, 1000);
            } else {
                $.notify('Please select fuel type and vehicle class', "error");
            }
        } else {
            $.notify('Your PUC Test failed..', "error");
        }
    }
}

function updatePUCResultContainer() {
    $('.puc_result_container').html('');
    if (puc_global?.test_result) {
        let html = '<table><tr>';
        Object.keys(puc_global?.test_result[0]).forEach(item => {
            html += `<th>${item}</th>`;
        })
        html += `</tr>`;
        puc_global?.test_result.forEach(item => {
            html += `<tr>`;
            for (key in item) {
                html += `<td>${item[key]}</td>`
            }
            html += `</tr>`;
        })
        html += '</table>';
        $('.puc_result_container').html(html);
    }
}
function formSubmitFunction() {
    $('.submitButtonCls').prop('disabled', true);
    if (!puc_global.isTestPass) {
        $.notify("Please add atleast one PUC test");
        return
    }
    // e.preventDefault();
    var state = $('#state').val();
    var rtocode = $('#rto_code').val();
    var district = $('#district').val();
    var ownername = $('#owner_name').val();
    var mobile = $('#mobile').val();
    var address1 = $('#address1').val();
    var technicianname = $('#technician_name').val();
    var vehicle = $('#vehicle').val();
    var engine = $('#engine').val();
    var chassi = $('#chassi').val();
    var vehicleclass = $('#vehicle_class').val();
    var vehiclemodel = $('#vehicle_model').val();
    var fueltype = $('#fuel_type').val();
    var vehiclenorms = $('#vehicle_norms').val();
    var testfees = $('#test_fees').val();
    // var manufacturer = $('#manufacturer').val();
    var makerclassification = $('#maker_classification').val();
    var registrationdate = $('#registration_date').val();
    // var speed = $('#speed').val();
    // var installationdate = $('#installation_date').val();
    var installationdate = moment(new Date()).format('YYYY-MM-DD');
    var validity = $('#validity').val();
    // var roto = $('#roto').val();
    var invoiceno = $('#invoice_no').val();
    var obj = {
        "state": state,
        "rtocode": rtocode,
        "district": district,
        "ownername": ownername,
        "mobile": mobile,
        "address1": address1,
        "technicianname": technicianname,
        "vehicle": vehicle,
        "engine": engine,
        "chassi": chassi,
        "vehicleclass": vehicleclass,
        "vehiclemodel": vehiclemodel,
        "fueltype": fueltype,
        "vehiclenorms": vehiclenorms,
        "testfees": testfees,
        //   "manufacturer": manufacturer,
        "makerclassification": makerclassification,
        "registrationdate": registrationdate,
        //   "speed": speed,
        "installationdate": installationdate,
        "validity": validity,
        //   "roto": roto,
        "invoiceno": invoiceno
    }
    if (fileData) {
        obj.image = fileData.path;
    } else {
        obj.image = 'nofile';
    }
    obj.testResult = JSON.stringify(puc_global?.test_result);
    let user = JSON.parse(localStorage.getItem("user"));
    obj.createdAt = user.id;
    $.ajax({
        type: "POST",
        url: './../../api/certificate/addCertificate.php',
        data: JSON.stringify(obj),
        contentType: "application/json",
        dataType: "json",
        success: function (data) {
            if (data.resCode.trim().toLowerCase() == "ok") {
                $.notify(data.Message, "success");
                $('#errorDiv').html(data.Message);
                setTimeout(()=>{
                    window.top.close();
                },550);
            } else {
                $('#errorDiv').html(data.Message);
                $.notify(data.Message, "error");
            }
        },
        error: function (err) {
            $('#errorDiv').html("Something went wrong please contact your administrator.");
        }
    })
}

const updateRtoCodeHandler = () => {
    optionHtml = `<option value="">----------Select RTO Code----------</option>`;
    rtoDetails.forEach(item => {
        optionHtml += `<option value='${item.value}'>${item.value}</optional>`
    })
    $("#rto_code").append(optionHtml);
}

$("#fuel_type").change(function (e) {
    let fuel_type = this?.value?.trim()?.toLowerCase() || "";
    if (fuel_type === "diesel") $('.test_more_button').removeClass('hide');
    else $('.test_more_button').addClass('hide');
})

// $("#vehicle_class").change(function (e) {
//     let vehicle_class = this?.value?.trim()?.toLowerCase() || "";
//     console.log('vehicle_class : ',vehicle_class);
//     if(vehicle_class === "mc" || vehicle_class === "auto") $("select option[value='Diesel']:selected").prop("disabled", true) //.attr('disabled',"disabled");// $('.test_more_button').removeClass('hide');
//     else $("#fuel_type option[value='Diesel']:selected").attr('disabled',"false");
// })
/**
 * { item_description }
 */
$("#inputGroupFile01").change(function (e) {
    e.stopPropagation();
    e.preventDefault();
    var file = this.files[0];
    var ownername = $('#owner_name').val().trim().toLowerCase().replaceAll(" ", "_");
    if (ownername) {
        var formData = new FormData();
        formData.append('file_ref', this.files[0]);
        formData.append('user_name', ownername);
        if (formData) {
            $.ajax({
                url: './../../api/fileManagement/fileManagement.php',
                type: 'POST',
                data: formData,
                async: false,
                cache: false,
                contentType: false,
                enctype: 'multipart/form-data',
                processData: false,
                success: function (res) {
                    // res = JSON.parse(res);
                    if (res.resCode.trim().toLowerCase() == "ok") {
                        $.notify(res.message, "success");
                        fileData = res;
                    } else {
                        $.notify(res.message, 'error');
                    }
                },
                error: function (res) {
                    $.notify(res.message, 'error');
                }
            });
        } else {
            $.notify("Please select any file...", "error");
        }

    } else {
        $.notify("Please add Owner name first", "error");
        $("#inputGroupFile01").val(null);
    }
    return false;
});