class Api::OrganizationsController < Api::BaseController

  def index
    orgs = Organization.all
    render json: orgs, each_serializer: OrganizationSerializer
  end

  def show
    render json: organization
  end

  def create
    organization = organization.create!(safe_params)
    render json: task, status: 201
  end

  def update
    organization.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    organization.destroy
    render nothing: true, status: 204
  end

  private
  def organization
    @organization ||= Organization.find(params[:id])
  end

  def user
    @user ||= organization.users.find(params[:id])
  end

  def safe_params
    params.require(:task).permit(:name, :description, :active)
  end
end