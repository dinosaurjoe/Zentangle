class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
    true  # Anyone can view a project
  end

  def create?
    true  # Anyone can create a project
  end

  def update?
    record.user == user  # Only project creator can update it
  end

  def destroy?
    record.user == user  # Only project creator can update it
  end
end
