class EventsController < InheritedResources::Base

  private

    def event_params
      params.require(:event).permit(:title, :start_time, :end_time, :description, :address, :photo)
    end
end

