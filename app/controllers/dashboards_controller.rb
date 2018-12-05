class DashboardsController < ApplicationController
  def mybookings
    @bookings = current_user.profile.bookings
    authorize @bookings
  end

  def myvehicles
  end

  def myvehiclestobook
  end
end
