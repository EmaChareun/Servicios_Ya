class Review < ApplicationRecord
  belongs_to :request
  belongs_to :user
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: { in: (1..5) }

end
