class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  skip_before_action :check_profile, only: :home

  def home
    @vehicles = Vehicle.all
  end
end
