class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def show?
    true
  end

  def update?
    record.user == user || record.plot.user == user
  end

  def destroy?
    record.user == user || record.plot.user == user
  end

  def accept?
    record.plot.user == user
  end

  def decline?
    record.plot.user == user
  end
end
