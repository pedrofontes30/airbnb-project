class Review < ApplicationRecord
  belongs_to :lesson
  belongs_to :user
  validates :content, :rating, presence: true
  validates :rating, inclusion: { in: (1..5) }
  # validates :content, length: { minimum: 10 }
end
