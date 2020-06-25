class LessonsController < ApplicationController

  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @lesson = Lesson.new
    @lessons = policy_scope(Lesson).order(created_at: :desc)
    if params[:query].present?
      sql_query = " \
        lessons.location ILIKE :query \
        OR lessons.difficulty ILIKE :query \
        OR users.first_name ILIKE :query \
        OR users.last_name ILIKE :query \
        OR sports.name ILIKE :query \
      "
      @lessons = Lesson.joins(:user, :sport).where(sql_query, query: "%#{params[:query]}%")
    else
      @lessons = Lesson.all
    end
    @markers = @lessons.map do |lesson|
      {
        lat: lesson.latitude,
        lng: lesson.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { lesson: lesson })
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
    @avg_review = (@reviews != [] ? @lesson.avg_review : 0)
    @user_owns_lesson = (@lesson.user == current_user)
  end

  def update
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.update(lesson_params)
    redirect_to lesson_path(params[:id])
  end


  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    authorize @lesson
    @lesson.save
    redirect_to lessons_path
  end

  private

  def lesson_params
    params.require(:lesson).permit(:description, :start_time, :end_time, :week_day, :location, :price, :max_attendees, :address, :photo, :sport_id, :difficulty)
  end
end

  # depois no lessons controller vais ter que filtrar as lessons ,
  # em vez de ser Lesson.all vai ser tipo Lesson.where(sport_id: sport.id)
  #  esse sport.id vais ter que ir busca lo nos params ou seja vais criar uma variavel
  # sport que vai ser igual Sport.find(name: params[:query] que foi o que o utilizador pesquisou no teu form.
