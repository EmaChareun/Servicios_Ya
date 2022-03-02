class RequestsController < ApplicationController
  before_action :set_user, only: %i[new]

  def index
    if current_user.role == "profesional"
      @my_requests = Request.where(professional_id: current_user.id)
      @requests = Request.where(user_id: current_user.id)
    else
      @requests = Request.where(user_id: current_user.id)
    end
  end

  def new
    @request = Request.new
  end

  def create
    @request = Request.new(request_params)
    @request.user_id = current_user.id
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
    params.require(:request).permit(:title, :city, :detail, :image, :professional_id)
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
