$(document).on('change', '#chart-types', function() {
    $("#linechart").hide();
    $("#barchart").hide();
    $("#piechart").hide();
   $("#"+$(this).val()).show();
});