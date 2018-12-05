class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @booking = Booking.new(set_params)
    authorize @booking
  end

  def delete
  end

  def set_params

  end

  def set_booking
    @booking = Booking.find(params[:id])
    authorize @booking
  end
end
