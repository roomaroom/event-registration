class AppointmentsController < ApplicationController
  # before_action :load_event, :only => :new

  def new
    load_event
    build_appointment
  end

  def index
    @appointments = if params[:event_id].present?
      load_event.appointments
    else
      Appointment.all
    end
  end

  def edit
    load_appointment
  end

  def update
    load_appointment
    build_appointment
    if @appointment.save
      redirect_to appointments_path, notice: "Оновлено"
    else
      redirect_to :back
    end
  end

  def create
    build_appointment
    save_appointment
  end

  def search
    if params[:term].present?
      @users = User.where("name LIKE ? OR CAST(mobile AS TEXT)  LIKE ?", "%#{params[:term]}%", "%#{params[:term]}%")
      @appointments = Appointment.where(user: @users)
      #@appointments = Appointment.search(params[:term]).records.page(params[:page]).per(20)
      #@appointments = @appointments.where(event_id: params[:event_id])
    end
    respond_to do |format|
      format.html { render :index }
      format.js
      
      format.json { render :json => @users.map(& :name) }
      #format.json { render :json => @appointments.map { |a| a.user.email } }
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

