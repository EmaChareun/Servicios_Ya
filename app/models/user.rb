class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :requests
  has_one_attached :photo
  has_many_attached :photos
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true
  validates :city, presence: true
  validates :role, presence: true
  geocoded_by :city
  after_validation :geocode, if: :will_save_change_to_city?
end
