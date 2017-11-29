function autocomplete() {
  document.addEventListener("DOMContentLoaded", function() {
    var plotLocation = document.getElementById('plot_location');

    if (plotLocation) {
      var autocomplete = new google.maps.places.Autocomplete(plotLocation, { types: [ 'geocode' ] });
      google.maps.event.addDomListener(plotLocation, 'keydown', function(e) {
        if (e.key === "Enter") {
          e.preventDefault(); // Do not submit the form on Enter.
        }
      });
    }
  });
}

export { autocomplete };
