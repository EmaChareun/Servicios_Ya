class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @user = policy_scope(User).where(user: current_user)
    if params[:query].present?
      @users = User.where("array_to_string(job, '||') ILIKE ? AND role = 'profesional'", "%#{params[:query]}%")
    else
      @users = User.where(role: "profesional")
    end
  end

  def show
    @user = User.find(params[:id])
    authorize @user
  end

  def edit
    @user = User.find(params[:id])
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
    @user.update(user_params)
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :phone_number, :city, :job, :role, photos: [])
  end
end
