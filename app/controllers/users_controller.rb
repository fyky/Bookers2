class UsersController < ApplicationController
  def show
    @book = Book.new
    @users = User.all
    @user = User.find(params[:id])
    @books = Book.where(user_id:@user.id)
        @userid = current_user.id
        @image = User.find(@userid)

  end
  
  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
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
   #@users = User.all    
    @users = User.all
    @image = User.find(@user)

    
  end
  
  
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
  


end

