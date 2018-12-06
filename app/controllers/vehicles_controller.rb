class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  skip_before_action :check_profile, only: :index
  before_action :set_vehicle, only: [:show, :edit, :update]

  def index
    @vehicles = policy_scope(Vehicle).order(created_at: :desc).where.not(latitude: nil, longitude: nil)

    @markers = @vehicles.map do |vehicle|
      {
        lng: vehicle.longitude,
        lat: vehicle.latitude,
        infoWindow: { content: render_to_string(partial: "/vehicles/map_window", locals: { vehicle: vehicle }) }
      }
    end
  end

  def show
    authorize @vehicle
    @markers = [
      {
        lng: @vehicle.longitude,
        lat: @vehicle.latitude,
        infoWindow: { content: render_to_string(partial: "/vehicles/map_window", locals: { vehicle: @vehicle }) }
      }
    ]
  end

  def new
    @vehicle = Vehicle.new
    authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(set_params)
    authorize @vehicle
    @vehicle.price = @vehicle.price * 100
    @vehicle.profile = current_user.profile
    if @vehicle.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  def edit
    authorize @vehicle
  end

  def update
    authorize @vehicle
    @vehicle.update(set_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :edit
    end
  end

  private

  def set_vehicle
    @vehicle = Vehicle.find(params[:id])
  end

  def set_params
    params.require(:vehicle).permit(
      :name,
      :photo,
      :type_id,
      :price,
      :description,
      :seats,
      :address_street,
      :address_city,
      :address_zipcode
    )
  end
end
