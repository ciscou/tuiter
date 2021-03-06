class TuitsController < ApplicationController
  before_filter :login_required, :except => :index

  def index
    @tuits = tuits_list.after(params[:after])
    @tuit  = current_user.tuits.build if logged_in?
  end

  def create
    @tuit = current_user.tuits.build(params[:tuit])
    respond_to do |format|
      if @tuit.save
        format.html { redirect_to tuits_url, :notice => "Successfully created tuit." }
        format.js
      else
        format.html {
          @tuits = tuits_list
          render :action => 'index'
        }
        format.js
      end
    end
  end

  private

  def tuits_list
    @user = User.find_by_username(params[:user_id])
    if @user
      @followership = current_user.followerships.find_or_initialize_by_followed_id(@user.id) if logged_in?
      @user.tuits
    else
      if logged_in?
        Tuit.where(:user_id => current_user.followerships.map(&:followed_id) + [current_user.id])
      else
        Tuit.scoped
      end
    end
  end
end
