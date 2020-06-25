class AddLevelsToLessons < ActiveRecord::Migration[6.0]
  def change
    add_column :lessons, :initial, :string
    add_column :lessons, :middle, :string
    add_column :lessons, :advanced, :string
  end
end
