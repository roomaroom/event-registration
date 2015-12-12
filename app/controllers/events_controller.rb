class EventsController < InheritedResources::Base
  helper_method :build_markers

  private

    def build_markers(events)
      markers = Gmaps4rails.build_markers(events) do |event, marker|
        marker.lat event.latitude
        marker.lng event.longitude
        #marker.picture url: '/images/map-pin-16.png', width: 15, height: 15
      end
    end

    def event_params
      params.require(:event).permit(:title, :start_time, :end_time, :description, :address, :photo)
    end
end

