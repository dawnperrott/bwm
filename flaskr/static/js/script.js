function initMap() {
  const map = new google.maps.Map(document.getElementById("map"), {
    zoom: 14.75,
    center: { lat: 52.663932513488604, lng: -8.626790079490577 },
  });
  const infoWindow = new google.maps.InfoWindow({
    content: "",
    disableAutoPan: true,
  });
  // Create an array of alphabetical characters used to label the markers.
  const labels = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
  // Add some markers to the map.
  const markers = locations.map((position, i) => {
    const label = labels[i % labels.length];
    const marker = new google.maps.Marker({
      position,
      label,
    });

    // markers can only be keyboard focusable when they have click listeners
    // open info window when marker is clicked
    marker.addListener("click", () => {
      infoWindow.setContent(label);
      infoWindow.open(map, marker);
    });
    return marker;
  });

  // Add a marker clusterer to manage the markers.
  const markerCluster = new markerClusterer.MarkerClusterer({ map, markers });
}

const locations = [
{ lat: 52.661012694370875, lng: -8.629495352162781 },
{ lat: 52.66196642024203, lng: -8.623727361576966 },
{ lat: 52.66088032363523, lng: -8.62812383158108 },
{ lat: 52.65900741759138, lng: -8.633844073908989 },
{ lat: 52.66147854713894, lng: -8.627799587400526 },
{ lat: 52.67050619102765, lng: -8.628596816236033 },
{ lat: 52.6673054426519, lng: -8.623220246925088 },
{ lat: 52.65642161684729, lng: -8.632205873909143 },
{ lat: 52.66960117111013, lng: -8.624107794875641 },

];

window.initMap = initMap;
