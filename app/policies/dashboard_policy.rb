class DashboardPolicy < ApplicationPolicy
  def mybookings?
    true
  end

  def myvehicles?
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
