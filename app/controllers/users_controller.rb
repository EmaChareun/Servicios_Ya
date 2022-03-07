class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = policy_scope(User)
    if params[:query].present?
      @users = User.where("array_to_string(job, '||') ILIKE ? AND role = 'profesional'", "%#{params[:query]}%")
    else
      @users = User.where(role: "profesional")
    end
  end

  def show
    # Mostrar las reviews del profesional
    @user = User.find(params[:id])
    @my_requests = Request.where(professional_id: @user)
    authorize @user
    # raise
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
    params.require(:user).permit(:first_name, :last_name, :phone_number, :city, :job, :role, :photos, :photos_professional)
  end
end
