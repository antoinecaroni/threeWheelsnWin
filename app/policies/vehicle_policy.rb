class VehiclePolicy < ApplicationPolicy
  def create?
    true
  end

  def show?
    true
  end

  def destroy?
    record.profile.user == user
  end

  def update?
    record.profile.user == user
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
