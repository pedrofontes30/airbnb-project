class Lesson < ApplicationRecord
  belongs_to :user
  validates :description, :start_time, :end_time, :week_day, :location, :max_attendees, presence: true
  # validates :start_time, :end_time, inclusion: { in: (0..23) }

  def under_limit?
    Appointment.where(lesson: self).length < max_attendees
  end

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
