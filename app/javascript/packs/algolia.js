import places from "places.js"

if (document.getElementById('address-input')) {
(function() {
  var placesAutocomplete = places({
    appId: 'plNB8HPI332W',
    apiKey: 'f0251e2b4ba67ea1b643dfa626ffc02d',
    container: document.getElementById('address-input'),
    templates: {
      value: function(suggestion) {
        return suggestion;
      }
    }
  }).configure({
    type: 'address'
  });
  placesAutocomplete.on('change', function resultSelected(e) {
    document.getElementById('address-input').value = e.suggestion.value || '';
    document.getElementById("profile_address_street").value = e.suggestion.name || '';
    document.getElementById("profile_address_city").value = e.suggestion.city || '';
    document.getElementById("profile_address_zipcode").value = e.suggestion.postcode || '';
  });
})();
}
