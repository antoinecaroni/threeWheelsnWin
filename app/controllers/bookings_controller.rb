class BookingsController < ApplicationController
  before_action :set_vehicle, only: [:new, :create]

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(set_params)
    authorize @booking
    @booking.vehicle = @vehicle
    @booking.price = ((@booking.end_date - @booking.start_date) * @vehicle.price).to_i
    @booking.profile = current_user.profile
    @booking.status = "Pending"
    if @booking.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
  end

  def delete
  end

  def set_params
    params.require(:booking).permit(
      :start_date,
      :end_date
    )
  end

  def set_vehicle
    @vehicle = Vehicle.find(params[:vehicle_id])
    authorize @vehicle
  end
end
