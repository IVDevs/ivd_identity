$(function() {
	$("#register").submit(function(e) {
		e.preventDefault(); // Prevent form from submitting
		
		// Verify date
		var date = $("#dateofbirth").val();
		var dateCheck = new Date($("#dateofbirth").val());
		if (dateCheck == "Invalid Date") {
			date == "invalid";
		}
		Events.Call("ivd_identity:register", [$("#firstname").val(), $("#lastname").val(), date, $("input[name='sex']:checked").val(), $("#height").val()]);
	});
});