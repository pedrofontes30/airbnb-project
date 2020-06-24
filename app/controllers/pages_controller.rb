class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    @sports = Sport.all
  end

  def profile
  end
end
