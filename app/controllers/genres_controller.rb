class GenresController < ApplicationController
  before_filter :check_if_admin, :only => [:new,:create,:update, :destroy] #they can do above plus index and destroy

  def index
    @genres = Genre.order(:name)
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(params[:genre])
     if @genre.save
      redirect_to(genres_path)
    else
      render :new
    end
  end

  def edit
    @genre = Genre.find(params[:id])
    render :new
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update_attributes(params[:genre])
      redirect_to(genres_path)
    else
      render :new
    end
  end

  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to(genres_path)
  end

end