class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update]

  def new
    @profile = Profile.new
    authorize @profile
  end

  def create
    @profile = Profile.new(set_params)
    authorize @profile
    @profile.user = current_user
    if @profile.save
      redirect_to vehicles_path
    else
      render :new
    end
  end

  def edit
    authorize @profile
  end

  def update
    authorize @profile
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def set_params
    params.require(:profile).permit(
      :first_name,
      :last_name,
      :photo,
      :address_street,
      :address_city,
      :address_zipcode
    )
  end
end
