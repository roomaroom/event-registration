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

  mapInitialization = (id) ->
    id_q = '#' + id
    locations = $(id_q)
    if(locations.length > 0)
      console.log 'g'
      handler = Gmaps.build("Google")
      handler.buildMap
        provider:
          maxZoom: 15,
          styles: locations.data('styles'),
          mapTypeControl: false,
          mapTypeControlOptions:
            mapTypeIds: [google.maps.MapTypeId.ROADMAP]
        internal: { id: id }, ->
          markers = handler.addMarkers(locations.data('markers'))
          handler.bounds.extendWith markers
          handler.fitMapToBounds()
  #mapInitialization("company-location")

  #$('.map-view').on 'click', ->
    #mapInitialization("companies-location-connect")

  $('#showMap').on 'shown.bs.modal', ->
    mapInitialization("company-location")


  $('.map-search').on 'shown.bs.modal', (e) ->
    currentId = 'map' + $(this).attr('id')
    mapInitialization(currentId)

  $('.map-view[data-toggle="tab"]').on 'shown.bs.tab', (e) ->
    mapInitialization("companies-connect")
