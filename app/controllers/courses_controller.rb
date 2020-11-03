class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  before_action :current_course, only: [:show, :edit, :update, :destroy]

  def index
    @courses = Course.all
  end

  def show
  end

  def new
    @course = Course.new
  end


  def create
    course = Course.create(course_params)

    redirect_to course_path(course)
  end

  def edit

  end

  def update
    @course.update(course_params)

    redirect_to course_path(@course)
  end
  def destroy
    @course.destroy
    redirect_to courses_path
  end

  private

  def is_admin
    if !current_user.admin
      redirect_to root_path
    end
  end
  def course_params
    params.require(:course).permit(:title, :credit, :code)
  end

  def current_course
    @course = Course.find(params[:id])
  end

end
