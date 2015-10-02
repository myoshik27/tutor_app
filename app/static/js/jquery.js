$(document).ready(function(){
  console.log("hello")
    getLocation();
  });
function getLocation(){
      console.log("funciont works")
      if (navigator.geolocation){
        navigator.geolocation.getCurrentPosition(showPosition);
      } else {
        html+"Geolocaion is not supported by this browser"
      }
    function showPosition(position){
      console.log(position.coords.latitude)
    }
    }