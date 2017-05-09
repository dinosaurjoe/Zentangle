class RolePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true  # Anyone can view a role
  end

  def create?
    record.project.owner == user  # Only project owner can create a role
  end

  def update?
    record.project.owner == user  # Only project creator can update it
  end

  def destroy?
    record.project.owner == user  # Only project creator can update it
  end
end
