class SemestersController < ApplicationController
  before_action :authenticate_user!
  before_action :is_admin
  before_action :current_semester, only: [:show, :edit, :update, :destroy]

  def index
    @semesters = Semester.all
  end

  def show
  end

  def new
    @semester = Semester.new
  end
  def create
    semester = Semester.create(semester_params)

    redirect_to semester_path(semester)
  end

  def edit

  end

  def update
    @semester.update(semester_params)

    redirect_to semester_path(@semester)
  end
  def destroy
    @semester.destroy
    redirect_to semesters_path
  end

  private
  def is_admin
    if !current_user.admin
      redirect_to root_path
    end
  end
  def semester_params
    params.require(:semester).permit(:name)
  end

  def current_semester
    @semester = Semester.find(params[:id])
  end
end
