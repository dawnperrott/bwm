// Initialize and add the map
function initMap() {
  // The location of Limerick
  const limerick = { lat: 52.668018, lng: -8.630498};
  // The map, centered at Limerick
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
    center: limerick,
  });
  // The marker, positioned at Limerick
  const marker = new google.maps.Marker({
    position: limerick,
    map: map,
  });
}

window.initMap = initMap;
