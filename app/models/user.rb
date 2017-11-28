class User < ApplicationRecord
  has_many :plots, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  mount_uploader :photo, PhotoUploader

end
