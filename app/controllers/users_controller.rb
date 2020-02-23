class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]
  before_action :require_same_user, only: [:edit, :update]
  def index
    @users = User.paginate(page: params[:page], per_page: 100)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Hello #{@user.username}! Welcome to BUNNY HOUSE!"
      redirect_to bukkens_path
    else
      render 'new'
    end
  end

def edit
  #@user = User.find(params[:id])
end

def update
  #@user = User.find(params[:id])
  if @user.update(user_params)
    flash[:success] = "Your account was updated successfully"
    redirect_to bukkens_path
  else
    render 'edit'
  end
end

def show
  #@user = User.find(params[:id])
end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

  def require_same_user
    if current_user != @user #This sets it so that a logged in user can only edit his own account
      flash[:danger] = "You can only edit your own account"
      redirect_to root_path
    end
  end

end
