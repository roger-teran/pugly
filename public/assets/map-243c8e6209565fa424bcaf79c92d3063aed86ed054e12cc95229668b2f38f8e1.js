//
//google.maps.visualRefresh = true;
//
//
//var map;
//function initialize() {
//    var mapOptions = {
//        zoom: 15,
//        mapTypeId: google.maps.MapTypeId.ROADMAP
//    };
//    map = new google.maps.Map(document.getElementById('map-canvas'),
//        mapOptions);
//    // try HTML5 geolocation
//    if(navigator.geolocation) {
//        navigator.geolocation.getCurrentPosition(function(position) {
//            var pos = new google.maps.LatLng(position.coords.latitude,
//                position.coords.longitude);
//
//            var infowindow = new google.maps.InfoWindow({
//                map: map,
//                position: pos,
//                content: 'You are here'
//            });
//
//            map.setCenter(pos);
//        }, function() {
//            handleNoGeolocation(true);
//        });
//    } else {
//        // browser doesn't support geolocation
//        handleNoGeolocation(false);
//    }
//}
//
//function handleNoGeolocation(errorFlag) {
//    if (errorFlag) {
//        var content = 'Error: The Geolocation service failed.';
//    } else {
//        var content = 'Error: Your browser doesn\'t support geolocation.';
//    }
//
//    var options = {
//        map: map,
//        position: new google.maps.LatLng(60, 105),
//        content: content
//    };
//
//    var infowindow = new google.maps.InfoWindow(options);
//    map.setCenter(options.position);
//}
//google.maps.event.addDomListener(window, 'load', initialize);
////Geo coding attempt
//



$(function(){

    var geocoder;
    var map;
    function initialize() {
        geocoder = new google.maps.Geocoder();
        var latlng = new google.maps.LatLng(40.71, -74.0059);
        var mapOptions = {
            zoom: 12,
            center: latlng
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
    }

    function codeAddress(address, title) {
        //var address =
        geocoder.geocode( { 'address': address}, function(results, status) {
            if (status == google.maps.GeocoderStatus.OK) {
                map.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: map,
                    position: results[0].geometry.location,
                    title: title
                });
                marker.setMap(map)
            } else {
                alert('Geocode was not successful for the following reason: ' + status);
            }
        });
    }


    //console.log(document.querySelector('#searchGoogle'))
    //$('#searchGoogle').click(function(evt){
    //    console.log('hey');
    //    var location = document.getElementById('address').value;
    //    codeAddress(location);
    //})

    $('.location-grabber').click(function(e){
        e.preventDefault();
        var loc = $(this).text();
        var titleSpan = $(this).closest('.title')
        var title = titleSpan.text();
        console.log(titleSpan);
        codeAddress(loc, title);
    })


    google.maps.event.addDomListener(window, 'load', initialize);



})

//console.log(document.querySelector('#searchGoogle'))






