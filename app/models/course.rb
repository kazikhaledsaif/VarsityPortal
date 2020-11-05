class Course < ApplicationRecord
  has_many :semester_courses
  has_many :semesters, through: :semester_courses
  has_many :enrollments
  has_many :users, through: :enrollments

end
