var getSpreadsheetURL = function(type) {
    $.getJSON('/getSpreadsheetURL', {sheet_type:'import_inventory'}, function(data) {
      document.getElementById('import_spreadsheet').value = data.result[0][2];
    });

    $.getJSON('/getSpreadsheetURL', {sheet_type:'export_master'}, function(data) {
      document.getElementById('export_spreadsheet').value = data.result[0][2];
    });
    return false;
}
