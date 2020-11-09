class ResultController < ApplicationController
  def index
    @users = User.all.where("id NOT IN(?) AND admin = false", current_user.id )
    @semester= Semester.find_by current: true
  end


  def show_user_courses
    @user = User.find(params[:user])
    @semester= Semester.find_by current: true
    @result = Result.new
  end
  def assign_grade

    result = Result.where( course_id: params[:course] , semester_id:  params[:semester], user_id:  params[:user] ).first_or_initialize
    result.course_id = params[:course]
    result.semester_id = params[:semester]
    result.user_id = params[:user]
    result.marks = params[:marks]
    if result.save

      flash[:success] = "Grading is done"
      redirect_back(fallback_location: root_path)
    else
      flash[:success] = "Please try again"
      redirect_back(fallback_location: root_path)
    end


  end



  private


end
