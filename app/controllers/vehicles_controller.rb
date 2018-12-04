class VehiclesController < ApplicationController
  skip_before_action :authenticate_user!, only: :index
  before_action :set_vehicle, only: :show

  def index
    @vehicles = policy_scope(Vehicle).order(created_at: :desc)
  end

  def show
    authorize @vehicle
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
