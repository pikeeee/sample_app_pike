class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :following, :followers]
  before_action :correct_user, only: [ :edit, :update]
  before_action :admin_user, only: [:destroy]
  def index
    @users = User.all
  end
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.page params[:page]
  end
  def feed
    Micropost.where("user_id = ?", id)
  end   
  def new
    @user = User.new
  end
  def create
    @user = User.new(users_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end
  def update
    @user = User.find(params[:id])
    if @user.update(users_params)
      redirect_to @user
    else
      render 'edit'
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to users_url
  end
  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.following.page params[:page]
    render 'show_follow'
  end
  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers.page params[:page]
    render 'show_follow'
  end
  private
  def users_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)      
  end
  def correct_user
    @user = User.find(params[:id])
      unless current_user == @user
         redirect_to root_url 
      end
  end
  def admin_user
    redirect_to root_url unless current_user.admin?
  end
end
