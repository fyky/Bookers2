class UsersController < ApplicationController
  def show
    @books = Book.all
    #@user = current_user.id
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @profile_images = User.new
    @user = User.find(params[:id])

  end
  
  def create
    @profile_image = User.new(profile_image_params)
    @profileimage.user_id = current_user.id
    @profile_image.save
    redirect_to user_path
  end



  def index
    @user = current_user.id
    @users = User.all
    @profile_images = User.all
  end
  
  
  private

  def profile_image_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end

