class Review < ApplicationRecord
  belongs_to :request, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: { in: (1..5) }
end
