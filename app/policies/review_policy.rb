class ReviewPolicy < ApplicationPolicy
  def mybookings?
    true
  end

  def create?
    record.booking.profile == user.profile && record.booking.status == "Accepted" && record.booking.end_date < Date.today
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
