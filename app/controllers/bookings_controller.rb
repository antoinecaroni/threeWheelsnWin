class BookingsController < ApplicationController
  before_action :set_vehicle, only: [:new, :create, :update]

  def new
    @booking = Booking.new
    authorize @booking
    @markers = [
      {
        lng: @vehicle.longitude,
        lat: @vehicle.latitude,
        infoWindow: { content: render_to_string(partial: "/vehicles/map_window", locals: { vehicle: @vehicle }) }
      }
    ]
  end

  def create
    @booking = Booking.new(set_params)
    authorize @booking
    @booking.vehicle = @vehicle
    unless @booking.end_date.blank? || @booking.start_date.blank?
      @booking.price = ((@booking.end_date - @booking.start_date) * @vehicle.price).to_i
    end
    @booking.profile = current_user.profile
    @booking.status = "Pending"
    if @booking.save
      redirect_to dashboards_mybookings_path
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    if params[:status] == 'Accepted'
      @booking.update(status: 'Accepted')
    elsif params[:status] == 'Declined'
      @booking.update(status: 'Declined')
    end
    redirect_to dashboards_myvehicles_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.delete
    redirect_to dashboards_mybookings_path
  end

  private

  def set_params
    params.permit(
      :start_date,
      :end_date
    )
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
    authorize @vehicle
  end
end
