class CreateSemesterCourses < ActiveRecord::Migration[6.0]
  def change
    create_table :semester_courses do |t|
      t.references :semester, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
