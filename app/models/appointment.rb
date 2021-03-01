class Appointment < ApplicationRecord
  validates :date, presence: true
  validate :date_cannot_be_in_the_past
  belongs_to :user
  belongs_to :car

  def date_cannot_be_in_the_past
    errors.add(:date, "can't be in the past") if date < Date.today
  end
end
