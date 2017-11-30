class Review < ApplicationRecord
  belongs_to :booking
  validates :content, :rating, :booking, presence: :true
  validates :rating, inclusion: { in: (1..5) }
end
