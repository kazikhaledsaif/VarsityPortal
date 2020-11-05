class AddCurrentToSemester < ActiveRecord::Migration[6.0]
  def change
    add_column :semesters, :current, :boolean ,default: false
  end
end
