class PagesController < ApplicationController
  def home
    @sports = Sport.all
  end

  def profile
  end
end
