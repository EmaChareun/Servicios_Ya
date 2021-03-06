class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = policy_scope(User)
    if params[:query].present?
    @users = User.where("job ILIKE ? AND role = 'profesional'", "%#{params[:query]}%").or(User.where("city ILIKE ? AND role = 'profesional'", "%#{params[:query]}%"))
    else
      @users = User.where(role: "profesional")
    end

    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        info_window: render_to_string(partial: "info_window", locals: { user: user })
      }
    end
  end

  def show
    # Mostrar las reviews del profesional
    @user = User.find(params[:id])
    @my_requests = Request.where(professional_id: @user)
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
    params.require(:user).permit(:first_name, :last_name, :phone_number, :city, :role, :photo, :job, photos: [])
  end
end
