class Api::UsersController < Api::BaseController

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def show
    render json: user
  end

  def create
    new_user = User.create!(safe_params)
    render json: new_user, status: 201
  end

  def update
    User.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    User.destroy
    render nothing: true, status: 204
  end

  private
  def user
    @User ||= User.find_by_id(params[:id])
  end

  def safe_params
    params.require(:user).permit(:email, :name)
  end
end