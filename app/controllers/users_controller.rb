class UsersController < ApplicationController
  before_action :user_find, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
#    @followings = @user.following_relationships # add for "followings-followers"
#    @followers = @user.follower_relationships   # add for "followings-followers"
    @users = @user.following_users
    @userd = @user.follower_users
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user #追加
    else
      render 'new'
    end
  end
  
  def edit
#    @user = User.find(params[:id])
  end
  
  def update
#    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:success] = "You profile is updated."
      redirect_to current_user
    else
      render 'edit'
    end
  end
  
  
  def followings
    @title = "Followings"
    @user = User.find(params[:id])
    @users = @user.following_users
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.follower_users
    render 'show_follow'
  end
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :age, :password, :password_confirmation)
  end
  
  def user_find
    @user = User.find(params[:id])
  end
  

end
