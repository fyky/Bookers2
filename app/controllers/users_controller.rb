class UsersController < ApplicationController
  def show

  end
  
  def edit
    @profile_image = User.new
  end

  def index
  end

end
