class LessonPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    user.role == 'teacher'
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
