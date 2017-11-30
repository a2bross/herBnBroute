class Plot < ApplicationRecord
  belongs_to :user
  validates :name, :description, :capacity, :location, :user, :daily_price, presence: true
  validates :capacity, numericality: { greater_than: 0 }
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
