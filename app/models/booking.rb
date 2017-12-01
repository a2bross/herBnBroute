class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :plot
  has_one :review
  validates :start_date, :end_date, :full_price, :status, :user, :plot, presence: true, allow_blank: false
  validates :status, inclusion: { in: ["pending", "accepted", "declined", "completed"]}
  validate :no_empty_date, :end_cannot_be_later_than_start, :cannot_start_in_the_past

  private

  def end_cannot_be_later_than_start
     unless end_date.nil?
      if end_date < start_date
        errors.add(:end_date, "can't be before the start date")
      end
    end
  end

  def cannot_start_in_the_past
    unless start_date.nil?
      if start_date < Date.today
        errors.add(:start_date, "can't be before today")
      end
    end
  end

  def no_empty_date
    if start_date.nil?
      errors.add(:start_date, "can't be blank")
    elsif start_date == ""
      errors.add(:start_date, "can't be blank")
    elsif end_date.nil?
      errors.add(:end_date, "can't be blank")
    elsif end_date == ""
      errors.add(:end_date, "can't be blank")
    end
  end

  def completed!
    status = "completed"
  end
end
