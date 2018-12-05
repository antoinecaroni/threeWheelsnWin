class DashboardsController < ApplicationController
  def mybookings
    @bookings = current_user.profile.bookings
    authorize @bookings
  end

  def myvehicles
    @vehicles = current_user.profile.vehicles
    authorize @vehicles
  end

  def myvehiclestobook
    @vehicles = current_user.profile.vehicles
    authorize @vehicles
  end
end
