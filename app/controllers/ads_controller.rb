class AdsController < ApplicationController
  
  def index
    @ads = Ad.all
  end
  
  def new 
    @ad = Ad.new
  end
  
  def create
    @ad = Ad.new(params[:ad])
    if @ad.save
    redirect_to ad_path(@ad)
    else
      render 'new'
    end
  end
  
  def show
    @ad = Ad.find(params[:id])
  end
  
end