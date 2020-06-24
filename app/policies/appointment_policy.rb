class AppointmentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    !user.has_appointment?(record.lesson) && user != record.lesson.user && record.lesson.under_limit?
  end

  def destroy?
    user.has_appointment?(record.lesson)
  end
end
