class ReviewsController < ApplicationController
  # before_action

  def show
    @review = Review.find(params[:id])
    authorize @review
  end

  def new
    # @request = Request.find(params[:request_id])
    @review = Review.new
    authorize @review
  end

  def create
    @review = Review.new(review_params)
    @request = Request.find(params[:request_id])
    @review.user = current_user
    authorize @review
    @review.request = @request
    if @review.save
      redirect_to request_path(@request)
    else
      render 'new'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end
