class AddDescriptionToSports < ActiveRecord::Migration[6.0]
  def change
    add_column :sports, :description, :string
  end
end
