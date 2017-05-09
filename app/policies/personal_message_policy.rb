class PersonalMessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end


  def new?
    true
  end

  def create?
    true
  end


  #because we check in the controller
end
