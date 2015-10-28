class AppointmentsController < ApplicationController
  # before_action :load_event, :only => :new



  def new
    load_event
    build_appointment
  end

  def index
    @appointments = Appointment.all
  end

  def edit
    load_appointment
  end

  def update
    load_appointment
    build_appointment
    save_appointment
  end

  def create
    build_appointment
    save_appointment
  end

  def search
    if params[:q].present?
      @appointments = Appointment.search(params[:q]).records.page(params[:page]).per(20)
    end
    respond_to do |format|
      format.html
      format.js
    end
  end

  private

    def appointment_params
      appointment_params = params[:appointment]
      appointment_params ? appointment_params.permit(:user_id, :event_id, :notice, :payment, :paid) : {}
      #params.require(:appointment).permit(:user_id, :event_id, :notice, :payment, :paid)
    end

    def load_appointment
      @appointment ||= Appointment.find(params[:id])
    end

    def load_event
      @event = Event.find(params[:event_id])
    end

    def build_appointment
      @appointment ||= Appointment.new
      @appointment.attributes = appointment_params
    end

    def save_appointment
      if @appointment.save
        redirect_to events_path, notice: "Ви успішно зареєстровані"
      else
        redirect_to :back
      end
      #end
    end
end

