class ReviewPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.has_appointment?(record.lesson) && user != record.lesson.user
  end
end
