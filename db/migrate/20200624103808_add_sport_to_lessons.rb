class AddSportToLessons < ActiveRecord::Migration[6.0]
  def change
    add_reference :lessons, :sport, null: false, foreign_key: true
  end
end
