class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
    @tuit  = current_user.tuits.build
  end

  def create
    @tuit = current_user.tuits.build(params[:tuit])
    if @tuit.save
      redirect_to tuits_url, :notice => "Successfully created tuit."
    else
      @tuits = Tuit.all
      render :action => 'index'
    end
  end
end
