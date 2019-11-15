import "bootstrap";
import "../plugins/init_datepicker";
import "select2";
import "select2/dist/css/select2.min.css";

import "mapbox-gl/dist/mapbox-gl.css"; // <-- you need to uncomment the stylesheet_pack_tag in the layout!

import { initMapbox } from "../plugins/init_mapbox";

initMapbox();

$(document).ready(function() {
  $(".js-example-basic-single").select2();
});
