class BandsController < ApplicationController

  def index
    @bands = Band.all
    render :index
  end

  def new
    @band = Band.new
    render :new
  end

  def create
    @band = Band.find_by(name: params[:band][:name])
    if @band
      flash.now[:errors] = @band.errors.full_messages
      redirect_to new_band_url
    else
      @band = Band.create(name: params[:band][:name])
      redirect_to bands_url
    end

  end


  def show
    @band = Band.find(params[:id])
    render :show
  end


  def edit
    @band = Band.find(params[:id])
    render :edit
  end


  def update
    @band = Band.find(params[:id])
    if @band
      @band.update_attributes(name: params[:band][:name])
      redirect_to band_url(@band)
    else
      render :edit
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    redirect_to bands_url
  end

  protected

  def band_params
    params.require(:band).permit(:name)
  end
end
