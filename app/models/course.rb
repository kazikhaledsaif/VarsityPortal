class Course < ApplicationRecord
  has_many :semester_courses
  has_many :semesters, through: :semester_courses
  has_many :enrollments
  has_many :users, through: :enrollments


  def get_result ( user, semester, course )
    user = User.find(user)
    semester = Semester.find(semester)
    course = Course.find(course)
=begin
    result = Result.find_by(course: course, semester: semester, user: user)
=end
    result = Result.where(["course_id = ? AND semester_id = ? AND user_id = ?", course, semester,user]).last
    if(result.nil?)
      "Not assigned"
    else
      result.marks
    end
  end

end
