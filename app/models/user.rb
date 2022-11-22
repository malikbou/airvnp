class User < ApplicationRecord
  has_many :bookings, through: :venues, dependent: :destroy
  has_many :bookings
  has_many :reviews, through: :bookings

  validates :first_name, :last_name, :role, :username_email, presence: true
  validates :username_email, uniqueness: { case_sensitive: false }
  # validates :username_email, confirmation: true --> ?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
