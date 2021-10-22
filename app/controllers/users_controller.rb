class UsersController < ApplicationController
  def show
    @books = Book.all
    @user = User.find(params[:id])
    @book = Book.new
  end
  
  def edit
    @profile_image = User.new


  end
  

  def index
    @users = User.all
  end
  

end
