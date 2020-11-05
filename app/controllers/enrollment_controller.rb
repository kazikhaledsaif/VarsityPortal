class EnrollmentController < ApplicationController
  def index
    @semester= Semester.find_by current: true

  end

  def add_course
    user = User.find(params[:user])
    begin
      already_exist_course = user.courses.find(params[:course])
      flash[:success] = "Course is already added"
      redirect_back(fallback_location: root_path)
    rescue
      course = Course.find(params[:course])
      user.courses << course
      flash[:success] = "Course is added"
      redirect_back(fallback_location: root_path)
    end
  end


  def remove_course
    user = User.find(params[:user])
    course = user.courses.find(params[:course])
    user.courses.delete(course)
    flash[:error] = "Course is removed"
    redirect_back(fallback_location: root_path)
  end

end
