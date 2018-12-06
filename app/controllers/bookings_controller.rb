class BookingsController < ApplicationController
  before_action :set_vehicle, only: [:new, :create, :update]

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
    # fails
    if @booking.save
      redirect_to vehicle_path(@vehicle)
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
