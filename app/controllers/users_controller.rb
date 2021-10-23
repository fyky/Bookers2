class UsersController < ApplicationController
  def show
    @books = Book.all

    @book = Book.new
    @users = User.all
    @user = User.find(params[:id])
  end
  
  def edit
    @user = User.find(params[:id])

  end
  
  def create
    #@profile_image = User.new(profile_image_params)
    #@profile_image.user_id = current_user.id
    #@profile_image.save
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end



  def index
    @user = current_user.id
    @users = User.all
    #@profile_images = User.all
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  


end

