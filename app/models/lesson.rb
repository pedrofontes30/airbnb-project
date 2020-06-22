class Lesson < ApplicationRecord
  belongs_to :user
  validates :description, :start_time, :end_time, :week_day, :location, :max_attendees, presence: true
end
