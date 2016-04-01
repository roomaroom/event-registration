class AppointmentsController < ApplicationController
  # before_action :load_event, :only => :new
  before_action :authenticate_user!
  before_action :admin_only, :only => :index

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
    load_event
    load_appointment
  end

  def update
    load_appointment
    paid_before_save = @appointment.paid + @appointment.children.pluck(:paid).reduce(:+)
    build_appointment
    if @appointment.save
      paid_after_save = @appointment.paid + @appointment.children.pluck(:paid).reduce(:+)
      current_user.increment!(:amount, paid_after_save - paid_before_save)
      redirect_to appointments_path, notice: "Оновлено"
    else
      redirect_to :back, alert: "Не вдалося зберегти, перевірте чи всі поля заповнені"
    end
  end

  def create
    @event = Event.find(params[:appointment][:event_id])
    build_appointment
    save_appointment
  end

  def search
    if params[:term].present?
      @users = User.where("LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR CAST(mobile AS TEXT)  LIKE ?", "%#{params[:term].mb_chars.downcase.to_s}%", "%#{params[:term]}%", "%#{params[:term]}%")
      #binding.pry
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

  def destroy
    load_appointment.destroy
    redirect_to :back
  end

  private
    def admin_only
      unless current_user.servant?
        redirect_to :back, :alert => "Access denied."
      end
    end

    def appointment_params
      appointment_params = params[:appointment]
      appointment_params ? appointment_params.permit(:user_id, :event_id, :notice, :payment, :paid, :level, children_attributes: [:id, :name, :age, :payment, :paid, :_destroy]) : {}
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
      respond_to do |format|
        if @appointment.save
          format.html {  redirect_to events_path, notice: "Ви успішно зареєстровані. Дякую!" }
        else
          format.html { render :new }
          format.json { render json: @appointment.errors, status: :unprocessable_entity }
        end
      end
    end
end

