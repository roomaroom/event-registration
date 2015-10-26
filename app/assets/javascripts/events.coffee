$ ->
  geocompleteMap =->
    $("#gmaps-input-address").geocomplete
      # map: "#company-address"
      # location: $("#gmaps-input-address").val()
      # markerOptions: {
      #   draggable: true
      # },
      details: ".details"
      detailsAttribute: "data-geo"
  geocompleteMap()