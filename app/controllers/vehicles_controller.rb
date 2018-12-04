class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_vehicle, only: :show

  def index
    @vehicles = policy_scope(Vehicle).order(created_at: :desc)
  end

  def show
    @vehicle = Vehicle.find(params[:id])
  end

  def new
    @vehicle = Vehicle.new
    # authorize @vehicle
  end

  def create
    @vehicle = Vehicle.new(set_params)
    if @vehicle.save
      redirect_to vehicle_path(@vehicle)
    else
      render :new
    end
    authorize @vehicle
  end

  def edit
    # authorize @vehicle
  end

  def update
    # authorize @vehicle
  end

  def delete
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
