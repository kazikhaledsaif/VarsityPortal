class SemesterCoursesController < ApplicationController

  def add_course
    semester = Semester.find(params[:id])
    begin
    already_exist_course = semester.courses.find(params[:course])
    flash[:success] = "Course is already added"
    redirect_back(fallback_location: root_path)
    rescue
    course = Course.find(params[:course])
    semester.courses << course
    flash[:success] = "Course is added"
    redirect_back(fallback_location: root_path)
    end
  end


  def remove_course
    semester = Semester.find(params[:id])
    course = semester.courses.find(params[:course])
    semester.courses.delete(course)
    flash[:error] = "Course is removed"
    redirect_back(fallback_location: root_path)
  end
end
