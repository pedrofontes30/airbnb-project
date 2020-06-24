class Lesson < ApplicationRecord
  belongs_to :user
  belongs_to :sport
  validates :description, :start_time, :end_time, :week_day, :location, :max_attendees, presence: true
  # validates :start_time, :end_time, inclusion: { in: (0..23) }

  def under_limit?
    Appointment.where(lesson: self).length < max_attendees
  end


  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  def avg_review
    avg_review = 0
    reviews = Review.where(lesson: self)
    reviews.each do |review|
      avg_review += review.rating
    end
    avg_review /= reviews.length
  end

end
