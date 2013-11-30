class Api::MembershipsController < Api::BaseController

  def index
    mems = Membership.all
    render json: mems, each_serializer: MembershipSerializer
  end

  def show
    render json: membership
  end

  def create
    new_membership = Membership.create!(safe_params)
    render json: new_membership, status: 201
  end

  def update
    Membership.update_attributes(safe_params)
    render nothing: true, status: 204
  end

  def destroy
    Membership.destroy
    render nothing: true, status: 204
  end

  private
  def membership
    @Membership ||= Membership.find_by_user_id(params[:id])
  end

  def user
    @user ||= Membership.user.find(params[:id])
  end

  def safe_params
    params.require(:membership).permit(:user_id, :organization_id, :expires_at, :membership_type_id)
  end
end