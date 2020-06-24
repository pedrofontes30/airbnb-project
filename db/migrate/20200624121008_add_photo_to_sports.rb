class AddPhotoToSports < ActiveRecord::Migration[6.0]
  def change
    add_column :sports, :photo, :string
  end
end
