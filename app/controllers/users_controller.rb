class UsersController < ApplicationController
  before_filter :check_if_logged_in, :except => [:new, :create] #they can only do new and create
  before_filter :check_if_admin, :only => [:index, :destroy] #they can do above plus index and destroy

  def index
    @users = User.order(:name)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to(root_path)
    else
      @obj = @album
      render :new #if user is not saved it goes back to the screen to show you the screen
    end
  end

  def edit
    @user = @auth
    render :new
  end

  def update
    @user = @auth
    if @user.update_attributes(params[:user])
      redirect_to(root_path)
    else
      @obj = @album
      render :new
    end
  end

# the private section has the check if the person is admin before they can delete
  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(users_path)
  end

  private
  def check_if_logged_in
    redirect_to(root_path) if @auth.nil?
  end

  def check_if_admin
    redirect_to(root_path) if @auth.nil? || !@auth.is_admin?
  end

end