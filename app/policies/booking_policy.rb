class BookingPolicy < ApplicationPolicy
  def new?
    true
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def update?
    true
  end

  def mybookings?
    true
  end

  def myvehiclestobook?
    true
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
