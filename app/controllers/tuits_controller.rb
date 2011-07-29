class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
    @tuit  = Tuit.new
  end

  def create
    @tuit = Tuit.new(params[:tuit])
    if @tuit.save
      redirect_to tuits_url, :notice => "Successfully created tuit."
    else
      @tuits = Tuit.all
      render :action => 'index'
    end
  end
end
