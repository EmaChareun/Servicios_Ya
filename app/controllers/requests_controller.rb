class RequestsController < ApplicationController
  before_action :set_user, only: %i[new create]

  def index
    @requests = Request.all
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user = @user
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def update
    @request = Request.find(params[:id])
    @request.update(request_params)
    redirect_to requests_path(@request)
  end

  private

  def request_params
    params.require(:request).permit(:title, :city, :detail, :image)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
