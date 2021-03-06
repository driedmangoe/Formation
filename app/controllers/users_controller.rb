class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      flash[:success] = "Welcome"
      redirect_to @user
    else
      render 'new'
    end
  end

    def update
      @user = User.find(params[:id])
 
      if @user.update(user_params)
        redirect_to @user
      else
      render 'edit'
      end
  end

  def teams
    @teams = User.find(params[:id]).teams
    @user = User.find(params[:id])
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :avatar)
    end
end