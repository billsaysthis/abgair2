class Api::MembershipTypesController < Api::BaseController

  def index
    mts = MembershipType.all
    render json: mts, each_serializer: MembershipTypeSerializer
  end

  def show
    render json: membership_type
  end

  def create
    membershipType = MembershipType.create!(safe_params)
    render json: membershipType, status: 201
  end

  def update
    MembershipType.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    MembershipType.destroy
    render nothing: true, status: 204
  end

  private
  def membership_type
    @MembershipType ||= MembershipType.find(params[:id])
  end

  def user
    @user ||= MembershipType.users.find(params[:id])
  end

  def safe_params
    params.require(:membership_type).permit(:name, :organization_id)
  end
end