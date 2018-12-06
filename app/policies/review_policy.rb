class ReviewPolicy < ApplicationPolicy
  def create?
    # record.booking.profile == current_user.profile && record.booking.status == "Accepted"
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
