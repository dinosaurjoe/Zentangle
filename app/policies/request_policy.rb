class RequestPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def decline?
    record.user == user || record.role.project.owner == user # only collaborator or project owner can decline request
  end

  def show?
    record.user == user || record.role.project.owner == user  # only collaborator or project owner can view request
  end

  def accept?
    true
  end

  def create?
    true  # Anyone can create a request
  end

  def destroy?
    record.created_by == user  # Only request creator can destroy it
  end
end
