class Plot < ApplicationRecord
  belongs_to :user
  validates :name, :description, :capacity, :location, :user, presence: true
  mount_uploader :photo, PhotoUploader
  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
