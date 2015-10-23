class AppointmentsController < InheritedResources::Base
  # before_action :load_event, :only => :new

  # def load_event
  #   @event = Event.find(params[:event_id])
  # end
  def search
    if params[:q].present?
      @appointments = Appointment.search_with_elasticsearch(params[:q], size: 40).records.page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end
    
  private

    def appointment_params
      params.require(:appointment).permit(:user_id, :event_id, :notice, :payment, :paid)
    end
end

