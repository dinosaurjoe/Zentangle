class ConversationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    p "hello"
    true
  end

  def show?
    true
  end


  #because we check in the controller
end
