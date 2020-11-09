class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :semester, null: false, foreign_key: true
      t.string    :marks,null: true

      t.timestamps
    end
  end
end
