class AppointmentsController < InheritedResources::Base
  # before_action :load_event, :only => :new

  # def load_event
  #   @event = Event.find(params[:event_id])
  # end

  private

    def appointment_params
      params.require(:appointment).permit(:user_id, :event_id, :notice, :payment, :paid)
    end
end

