class BookingPolicy < ApplicationPolicy
  def create?
    true
  end

  def destroy?
    record.profile == user.profile
  end

  def update?
    record.vehicle.profile == user.profile
  end

  def mybookings?
    record.all? { |booking| booking.profile == user.profile }
  end

  def myvehiclestobook?
    record.all? { |booking| booking.vehicle.profile == user.profile }
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
