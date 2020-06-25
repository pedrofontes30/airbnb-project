class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, :first_name, :last_name, :age, :role, presence: true
  has_many :appointments
  has_many :lessons, through: :appointments

  def has_appointment?(lesson)
    appointments.any?{ |appointment| appointment.lesson == lesson }
  end

  def appointment(lesson)
    raise
    appointments.find_by lesson: lesson
  end
end
