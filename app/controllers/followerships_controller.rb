class FollowershipsController < ApplicationController
  before_filter :login_required

  def create
    @followership = current_user.followerships.build(params[:followership])
    @followership.save!
    redirect_to user_tuits_url @followership.followed
  end

  def destroy
    @followership = current_user.followerships.find(params[:id])
    @followership.destroy
    redirect_to user_tuits_url @followership.followed
  end
end
