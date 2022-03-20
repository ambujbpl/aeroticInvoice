var user = localStorage.getItem('user');
if (user) {
	user = JSON.parse(user);
} else {
	logoutFunction();
}

$(document).ready(function () {
	getCertificateDataFromServer();
})
const getCertificateDataFromServer = () => {
	var url_string = window.location.href
	var url = new URL(url_string);
	var id = url.searchParams.get("id");
	let query = `select * from certificates where id=${id}`;
	$.when(Posthandler("./../../api/custom/custom_query.php", { 'query': query, 'token': user.token }, true)).done(function (res) {
		if (res.resCode.trim().toLowerCase() == "ok") {
			$.notify(res.message, "success");
			setTimeout(async () => {
				let query1 = `select center_code, center_name, center_address, mobile from users where id=${res.data[0]['createdAt']}`;
				$.when(Posthandler("./../../api/custom/custom_query.php", { 'query': query1, 'token': user.token }, true)).done(async function (res1) {
					if (res1.resCode.trim().toLowerCase() == "ok") {
						let result = { ...res?.data[0], ...res1?.data[0] };
						result.testResult = JSON.parse(result.testResult);
						await updatePUCDetailsHtml(result);
						if (result?.fuelType?.trim()?.toLowerCase() === "diesel") {
							$('.dieselView').removeClass('hide');
							$('.petrolView').addClass('hide');
						} else {
							$('.petrolView').removeClass('hide');
							$('.dieselView').addClass('hide');
						}
					}
				});
				// hideLoader();
			}, 250);
		} else {
			$('#errorDiv').html(res.message);
			$.notify(res.message, "error");
			setTimeout(() => {
				window.close();
			}, 1500)
		}
	}).fail(function () {
		$.notify("Something went wrong please contact your administrator.", "error");
		console.log("Error executing AJAX request. Please contact your administrator");
	});
};
updatePUCDetailsHtml = async (res) => {
	$("#invoice_no").html(res["invoiceNo"]);
	$("#vehicle").html(res["vehicleNo"]);
	$("#chassi").html(res["chassisNo"]);
	$('#district').html(res.district);
	$("#engine").html(res["engineNo"]);
	$("#owner_name").html(res["ownerName"]);
	$("#registration_date").html(res["registrationDate"]);
	$("#vehicle_norms").html(res["vehicleNorms"]);
	$("#vehicle_class").html(res["vehicleClass"]);
	$('#maker_classification').html(res.makerClassification);
	$('#vehicle_model').html(res.vehicleModel);
	$('#fuel_type').html(res.fuelType);
	$('#installation_date').html(moment(res.installationDate).format("DD-MM-YYYY"));
	$('#test_fees').html(res["testFees"]);
	$('.fuel_type').html(res["fuelType"]);
	if (res.image && res.image != "nofile") $('#certificate_img').attr("src", "./../" + res.image);
	if (res.fuelType.trim().toLowerCase() === "diesel") {
		let tableHtml = `<thead><tr class='w-full border border-gray-600 p-1'><th class='w-1/5 border border-gray-600 p-1'>SN</th>`;
		res?.testResult.forEach((item, index) => {
			if (index === 0) {
				for (key in item) {
					if (!["Light Absorption Coefficient (Permisable Limit)", "Measured Value"].includes(key)) {
						tableHtml += `<th class='w-1/5 border border-gray-600 p-1'>${key}</th>`;
					}
				}
				tableHtml += `</tr></thead><tbody><tr class='w-full border border-gray-600 p-1'>`
			}
			tableHtml += `<td class='w-1/5 border border-gray-600 p-1'>Test ${index + 1}</td>`;
			for (key in item) {
				if (!["Light Absorption Coefficient (Permisable Limit)", "Measured Value"].includes(key)) {
					tableHtml += `<td class='w-1/5 border border-gray-600 p-1'>${item[key]}</td>`;
				}
			}
			tableHtml += `</tr>`;
		})
		let lengthOfArray = res?.testResult.length;
		// const LightAbsorptionCoefficientAvg = res?.testResult[0]['Light Absorption Coefficient (Permisable Limit)']
		// const MeasuredValueAvg = ((res?.testResult.map(item => item['Measured Value']).reduce((a, b) => a + b, 0)) / lengthOfArray);
		const IdleRPMAvg = ((res?.testResult.map(item => item['Idle RPM']).reduce((a, b) => a + b, 0)) / lengthOfArray);
		const MaxRPMAvg = ((res?.testResult.map(item => item['Max RPM']).reduce((a, b) => a + b, 0)) / lengthOfArray);
		const k_valueAvg = ((res?.testResult.map(item => item['k_value']).reduce((a, b) => a + b, 0)) / lengthOfArray);
		const OilTempAvg = 0;
		$('.measuredValue').html(k_valueAvg.toFixed(2));
		// tableHtml += `<tr class='w-full border border-gray-600 p-1'>
		// 				<td class='w-1/5 border border-gray-600 p-1'>Avg</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${LightAbsorptionCoefficientAvg.toFixed(2)}</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${MeasuredValueAvg.toFixed(2)}</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${IdleRPMAvg.toFixed(2)}</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${MaxRPMAvg.toFixed(2)}</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${k_valueAvg.toFixed(2)}</td>
		// 				<td class='w-1/5 border border-gray-600 p-1'>${OilTempAvg.toFixed(2)}</td>
		// 			  </tr>`;
		tableHtml += `<tr class='w-full border border-gray-600 p-1'>
						<td class='w-1/5 border border-gray-600 p-1'>Avg</td>
						<td class='w-1/5 border border-gray-600 p-1'>${IdleRPMAvg.toFixed(2)}</td>
						<td class='w-1/5 border border-gray-600 p-1'>${MaxRPMAvg.toFixed(2)}</td>
						<td class='w-1/5 border border-gray-600 p-1'>${k_valueAvg.toFixed(2)}</td>
						<td class='w-1/5 border border-gray-600 p-1'>${OilTempAvg.toFixed(2)}</td>
					  </tr>`;
		tableHtml += `</tbody>`;
		$('.dieselViewTable').html(tableHtml);
	} else {
		$('.PrescribedStandardCO').html(res.testResult['Prescribed Standard CO']);
		$('.MesuredValueCO').html(res.testResult['Measured Value CO']);
		$('.PrescribedStandardHC').html(res.testResult['Prescribed Standard HC']);
		$('.MesuredValueHC').html(res.testResult['Measured Value']);
		$('.coValue').html(res.testResult['Measured Value CO']);
		$('.coCorrected').html(res.testResult['Measured Value CO']);
		$('.hcValue').html(res.testResult['Measured Value']);
		$('.co2Value').html(res.testResult['CO2']);
		$('.o2Value').html(res.testResult['O2']);
	}
	$('.centerCode').html(res?.center_code);
	$('.centerName').html(res?.center_name);
	$('.centerMobile').html(res?.mobile);
	$('.centerAddress').html(res?.center_address);//center_name, center_address
}
$("#print").click(function () { // calls the id of the button that will print
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
$('#home_Title').html("Add Certificate Page");