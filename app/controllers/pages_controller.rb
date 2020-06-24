class PagesController < ApplicationController
  def home
    @lesson = Lesson.new
  end

  def profile
  end
end
