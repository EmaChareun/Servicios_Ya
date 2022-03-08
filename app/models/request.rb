class Request < ApplicationRecord
  belongs_to :user
  belongs_to :professional, class_name: "User", foreign_key: "professional_id", optional: true
  # when request is destroyed, destroy will be called on its associated reviews.
  has_many :reviews, dependent: :destroy
  has_many_attached :photos
  validates :title, presence: true
  validates :detail, presence: true
  validates :city, presence: true
end
