class UsersController < ApplicationController
   def index
   	@users = User.all 
  	end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params.require(:user).permit(:name))
      if @user.save
        redirect_to users_path
      else
        render 'new'
      end
  end


  def show
    @user = User.find(params[:id])
  end
  
  def update
  end

  def destroy
  end



end
