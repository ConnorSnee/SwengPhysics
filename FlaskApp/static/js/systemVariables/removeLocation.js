var removeLocation = function(location_id) {
  console.log("LOCATION ID: " + location_id);
    $.getJSON('/removeLocation', {location_id:location_id}, function(data) {
      location.reload();
    });
    return false;
}
