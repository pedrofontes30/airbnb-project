class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  validates :description, :start_time, :end_time, :week_day, :location, :max_attendees, presence: true
  # validates :start_time, :end_time, inclusion: { in: (0..23) }
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def under_limit?
    Appointment.where(lesson: self).length < max_attendees
  end

  def appointments
    Appointment.where(lesson: self)
  end

  def avg_review
    avg_review = 0
    reviews = Review.where(lesson: self)

    return 0 if reviews == []

    reviews.each do |review|
      avg_review += review.rating
    end
    avg_review /= reviews.length
  end

end
