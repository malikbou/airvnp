class User < ApplicationRecord
  has_many :bookings, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings
  has_many :venues

  validates :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  # validates :username_email, confirmation: true --> ?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
