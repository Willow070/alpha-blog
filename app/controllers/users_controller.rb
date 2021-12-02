class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

  def create
    if @user.save
        flash[:notice] = "Welcome #{@user.username} to the Blog!"
        session[:user_id] = @user.id
        redirect_to articles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash["notice"] = "Your account information was successfully updated"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show
    @articles = @user.articles.paginate(page: params[:page], per_page: 3)
  end

  private

  def user_params
      params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
