import places from "places.js"

if (document.getElementById('address-input')) {
(function() {
  var placesAutocomplete = places({
    appId: 'plNB8HPI332W',
    apiKey: 'f0251e2b4ba67ea1b643dfa626ffc02d',
    container: document.getElementById('address-input'),
    templates: {
      value: function(suggestion) {
        return suggestion.name +', ' + suggestion.city;
      }
    }
  }).configure({
    type: 'address'
  });
  placesAutocomplete.on('change', function resultSelected(e) {
    if (document.getElementById("profile_address_street")) {document.getElementById("profile_address_street").value = e.suggestion.name || '';}
    if (document.getElementById("profile_address_city")) {document.getElementById("profile_address_city").value = e.suggestion.city || '';}
    if (document.getElementById("profile_address_zipcode")) {document.getElementById("profile_address_zipcode").value = e.suggestion.postcode || '';}
    if (document.getElementById("vehicle_address_street")) {document.getElementById("vehicle_address_street").value = e.suggestion.name || '';}
    if (document.getElementById("vehicle_address_city")) {document.getElementById("vehicle_address_city").value = e.suggestion.city || '';}
    if (document.getElementById("vehicle_address_zipcode")) {document.getElementById("vehicle_address_zipcode").value = e.suggestion.postcode || '';}

  });
})();
}
