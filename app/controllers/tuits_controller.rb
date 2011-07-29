class TuitsController < ApplicationController
  def index
    @tuits = Tuit.all
  end

  def show
    @tuit = Tuit.find(params[:id])
  end

  def new
    @tuit = Tuit.new
  end

  def create
    @tuit = Tuit.new(params[:tuit])
    if @tuit.save
      redirect_to @tuit, :notice => "Successfully created tuit."
    else
      render :action => 'new'
    end
  end

  def edit
    @tuit = Tuit.find(params[:id])
  end

  def update
    @tuit = Tuit.find(params[:id])
    if @tuit.update_attributes(params[:tuit])
      redirect_to @tuit, :notice  => "Successfully updated tuit."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @tuit = Tuit.find(params[:id])
    @tuit.destroy
    redirect_to tuits_url, :notice => "Successfully destroyed tuit."
  end
end
