class Plot < ApplicationRecord
  belongs_to :user
  validates :name, :description, :capacity, :location, :user, :daily_price, presence: true
  validates :capacity, numericality: { greater_than: 0 }
  has_many :bookings, dependent: :destroy
  has_many :reviews, through: :bookings, dependent: :destroy
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
