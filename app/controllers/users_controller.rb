class UsersController < ApplicationController
  def show
    @books = Book.all

  end
  
  def edit
    @profile_image = User.new
    @user = User.find(params[:id])
  end
  

  def index
    @users = User.all
  end

end
