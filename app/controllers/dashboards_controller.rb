class DashboardsController < ApplicationController
  def mybookings
    @bookings = current_user.profile.bookings
    @review = Review.new
    authorize @review
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
