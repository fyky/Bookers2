class UsersController < ApplicationController
  def show
    @books = Book.all
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @user = User.find(params[:id])

  end
  
  def create

  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)  
  end



  def index
    @user = current_user.id
    @users = User.all
    @profile_images = User.all
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name)
  end
  


end

