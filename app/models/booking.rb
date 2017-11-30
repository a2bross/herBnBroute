class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  has_one :review
  validates :start_date, :end_date, :full_price, :status, :user, :plot, presence: true
  validates :status, inclusion: { in: ["pending", "accepted", "declined", "completed"]}
  validate :end_cannot_be_later_than_start, :cannot_start_in_the_past

  private

  def end_cannot_be_later_than_start
    if end_date < start_date
      errors.add(:end_date, "can't be before the start date")
    end
  end

  def cannot_start_in_the_past
    if start_date < Date.today
      errors.add(:start_date, "can't be before today")
    end

    def completed!
      status = "completed"
    end
  end

end
