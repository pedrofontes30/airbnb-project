class AddLevelsToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :difficulty, :string
  end
end
