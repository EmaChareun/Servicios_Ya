class Review < ApplicationRecord
  validates :request_id, uniqueness: { scope: :user_id, message: "Ya hiciste una reseña" }
  belongs_to :request, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates :content, presence: true
  validates :rating, numericality: true, inclusion: { in: (1..5) }

  def self.random_review(request)
    Review.all.where(request_id: request.id)
  end
end
