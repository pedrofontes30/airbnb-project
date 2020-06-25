class LessonsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lesson = Lesson.new
    @lessons = policy_scope(Lesson).order(created_at: :desc)
    @lessons = Lesson.all
    @markers = @lessons.map do |flat|
      {
        lat: flat.latitude,
        lng: flat.longitude
      }
    end
  end

  def show
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @user = current_user
    @appointment = Appointment.new(lesson: @lesson)
    @appointments = Appointment.where(lesson: @lesson)
    @review = Review.new(lesson: @lesson)
    @reviews = Review.where(lesson: @lesson)
    @avg_review = (@reviews != [] ? @lesson.avg_review : 0 )
    @user_owns_lesson = (@lesson.user == current_user)
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.update(lesson_params)
    redirect_to lesson_path(params[:id])
  end


  def create
    # raise
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    authorize @lesson
    @lesson.save
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:description, :start_time, :end_time, :week_day, :location, :price, :max_attendees, :sport_id)
  end
end

  # depois no lessons controller vais ter que filtrar as lessons ,
  # em vez de ser Lesson.all vai ser tipo Lesson.where(sport_id: sport.id)
  #  esse sport.id vais ter que ir busca lo nos params ou seja vais criar uma variavel
  # sport que vai ser igual Sport.find(name: params[:query] que foi o que o utilizador pesquisou no teu form.


    Lesson.where(sport_id: sport.id)












