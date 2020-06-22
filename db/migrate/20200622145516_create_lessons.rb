class CreateLessons < ActiveRecord::Migration[6.0]
  def change
    create_table :lessons do |t|
      t.text :description
      t.string :start_time
      t.string :end_time
      t.string :week_day
      t.string :location
      t.references :user, null: false, foreign_key: true
      t.integer :max_attendees

      t.timestamps
    end
  end
end
