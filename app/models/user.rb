class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews
  has_many :requests
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone_number, presence: true, numericality: true
  validates :city, presence: true
  validates :job, presence: true
  validates :role, presence: true
end
