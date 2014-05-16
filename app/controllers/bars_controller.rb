class BarsController < ApplicationController

before_action :authenticate_user

  def index
    @bars = Bar.all
  end

  def new
    @bar = Bar.new
  end

  def create
    @bar = Bar.new(params.require(:bar).permit(:name, :category))
      if @bar.save
        redirect_to bars_path
      else
        render 'new'
      end
  end


  def edit
    @bar = Bar.find(params[:id])
  end

  def show
    @bar = Bar.find(params[:id])
  end
  
  def update
  end

  def destroy
    @bar = Bar.find(params[:id])
    @bar.destroy
    redirect_to :root
  end


  private
    def verify_logged_in
    if !current_user
      flash[:error] = "You must log in!!!"
      redirect_to new_sessions_path
    end
  end

end
