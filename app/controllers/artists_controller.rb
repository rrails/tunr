class ArtistsController < ApplicationController
  before_filter :check_if_admin, :only => [:new,:create,:update, :destroy] #they can do above plus index and destroy

  def index
    @artists = Artist.order(:name)
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(params[:name])
    if @artist.save
      redirect_to(artists_path)
    else
      render :new
    end
  end

  def update
    @artist = Artist.find(params[:id])
    if @artist.update_attributes(params[:artist])
      redirect_to(artist_path)
    else
      render :new
    end
  end

  def destroy
    @artist = Artist.find(params[:id])
    @artist.destroy
    redirect_to(artists_path)

  end
end
