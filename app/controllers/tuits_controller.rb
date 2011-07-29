class TuitsController < ApplicationController
  before_filter :login_required, :except => :index

  def index
    @tuits = tuits_list
    @tuit  = current_user.tuits.build if logged_in?
  end

  def create
    @tuit = current_user.tuits.build(params[:tuit])
    if @tuit.save
      redirect_to tuits_url, :notice => "Successfully created tuit."
    else
      @tuits = tuits_list
      render :action => 'index'
    end
  end

  private

  def tuits_list
    @user = User.find(params[:user_id]) if params[:user_id]
    if @user
      @user.tuits
    else
      Tuit.all
    end
  end
end
