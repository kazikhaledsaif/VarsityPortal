class AddYearToSemester < ActiveRecord::Migration[6.0]
  def change
    add_column :semesters, :year, :string, default: ''
  end
end
