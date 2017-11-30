class User < ApplicationRecord
  has_many :plots, dependent: :destroy
  has_many :bookings
  has_many :bookings_as_owner, through: :plots, source: :bookings
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, presence: true

  after_create :define_photo_number

  def define_photo_number
    self.photo = rand(1..5)
    self.save
  end
end
