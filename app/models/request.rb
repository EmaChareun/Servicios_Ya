class Request < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User", foreign_key: "professional_id", optional: true
  has_many :reviews

  validates :title, presence: true
  validates :detail, presence: true
  validates :city, presence: true
end
