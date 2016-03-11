class EventsController < ApplicationController
  helper_method :build_markers

  def index
    @events = Event.all
  end

  def show
    @event    = Event.find params[:id]
    @comments = @event.comments.with_state([:draft, :published])
  end

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

