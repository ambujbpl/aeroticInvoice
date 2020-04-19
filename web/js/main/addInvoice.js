var user = localStorage.getItem('user');
if(user){
	user = JSON.parse(user);
}else{
	logoutFunction();
}
$(document).ready(async function() {
	await updateBasics();
	hideLoader();
	$(".datepicker-default").datepicker({
		"dateFormat": 'dd-mm-yy',
		"todayHighlight": true,
		"setDate": new Date(),
		"autoclose": true
	});
	// $(".datepicker-default").datepicker("setDate", new Date());
	var today = new Date();
	$("#date").val(moment(today).format('DD-MM-YYYY'));
});

/**
 * { function_description }
 */
updateBasics = async () => {
	executeCustomQuery("select * from basic","updatebasics","","");
	// executeCustomQuery("select count(*) as invoiceNumber from invoices","updateinvoicenumber","","");
	executeCustomQuery("select * from product","updateInvoiceItems","itemsTableBody","");
}

/**
 * Shows the loader.
 */
showLoader = () => {
	setTimeout(()=>{
		$('.loader').removeClass("hide");
		$('.bodycontainer').addClass("hide");		
	},2000);
}

/**
 * Hides the loader.
 */
hideLoader = () => {
	setTimeout(()=>{
		$('.loader').addClass("hide");
		$('.bodycontainer').removeClass("hide");		
	},2000);
}


    function saveInDBFunction() {

      var myTableArray = [];
      var table = $("#items tbody");
      table.find('tr').each(function(i) {
        var $tds = $(this).find('td textarea'),
          $tds1 = $(this).find('td .price'),
          productName = $tds.eq(0).val(),
					// productName = $('textarea#Name').val(),
          productDesc = $tds.eq(1).val(),
					// productDesc = $('textarea#Type').val(),
          productCost = $tds.eq(2).val(),
          productQuantity = $tds.eq(3).val(),
          productPrize = $tds1.text();
        var obj = {
          "productName": productName,
          "productDesc": productDesc,
          "productCost": productCost,
          "productQuantity": productQuantity,
          "productPrize": productPrize
        };
        if (productName) {
          myTableArray.push(obj);
        }
      });
      var Invoice = $('#invoiceNumber').text();
      var Invoice_Date = $('#date').val();
      console.log("Invoice_Date old : ",Invoice_Date);
      Invoice_Date = moment(Invoice_Date,"DD-MM-YYYY").format('YYYY-MM-DD');
      console.log("Invoice_Date new : ",Invoice_Date);
      var Subtotal = $('#subtotal').text();
      var Gst = $('#gst').text();
      var Total = $('#total').text();
      var Amount_Paid = $('#paid').val();
      var Amount_Due = $('#due').text();
      var selfName = $('#selfName').val().trim();
      var selfAddress = $('#selfAddress').val().trim();
      var selfPhone = $('#selfPhone').val().trim();
      var selfGst = $('#selfGst').val().trim();
      var gstPercent = $('#gstPercent').val().trim();
      var PartyName = $('#PartyName').val().trim();
      var PartyAddress = $('#PartyAddress').val().trim();
      var PartyPhone = $('#PartyPhone').val().trim();
      var PartyGst = $('#PartyGst').val().trim();
      var registrationNumber = $('#registrationNumber').val().trim();
      var header = $('#header').val();
			var Address = {
				"selfName": selfName,
				"selfAddress": selfAddress,
				"selfPhone": selfPhone,
				"selfGst": selfGst,
				"gstPercent":gstPercent,
			};
			var customer_address = {
				"PartyName": PartyName,
				"PartyAddress": PartyAddress,
				"PartyPhone": PartyPhone,
				"PartyGst": PartyGst,
        "Registration":registrationNumber,
        "header":header,
			};
      var invoiceobj = {
        "Invoice_Date": Invoice_Date,
        "Subtotal": Subtotal,
        "Gst": Gst,
        "Total": Total,
        "Amount_Paid": Amount_Paid,
        "Amount_Due": Amount_Due,
				"Address":JSON.stringify(Address),
				"customer_address":JSON.stringify(customer_address),
				"Registration":registrationNumber,
        "header":header,
        "updated_by":user.userid
      }
      $.ajax({
        type: 'POST',
        url: '/aeroticInvoice/api/invoice/Add_invoices.php',
        data: {
          "invoiceobj": invoiceobj,
        	"product_details":JSON.stringify(myTableArray)
        },
        dataType: "JSON",
      }).done(function(data) { // if getting done then call.
        swal(data.resCode, data.Message, "success")
      });
    };
    $("#print").click(function() { // calls the id of the button that will print
      $('.theme-config').addClass('hide');
      $('.hiderow').addClass('hide');
      $('.print_Div').addClass('hide');
			$('.home').addClass('hide');
      if (print()) { // shows print preview.
        $('.theme-config').removeClass('hide');
        $('.hiderow').removeClass('hide');
        $('.print_Div').removeClass('hide');
				$('.home').removeClass('hide');
      } else { // else statement will check if cancel button is clicked.
        $('.theme-config').removeClass('hide');
        $('.hiderow').removeClass('hide');
        $('.print_Div').removeClass('hide');
				$('.home').removeClass('hide');
      }
    });
		$('#home_Title').html("Add Invoice Page");