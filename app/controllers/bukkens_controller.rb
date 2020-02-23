class BukkensController < ApplicationController
  before_action :set_bukken, only: [:edit, :update, :show, :destroy]
  before_action :require_user, except: [:index, :show]
  before_action :require_same_user, only: [:edit, :update, :destroy]

  def index
    @bukkens = Bukken.paginate(page: params[:page], per_page: 100)
  end

  def new
    @bukken = Bukken.new
  end

  def edit

  end

  def create
    @bukken = Bukken.new(bukken_params)
    @bukken.user = current_user
    if @bukken.save
      flash[:success] = "Bukken was successfully created"
      redirect_to bukken_path(@bukken)
    else
      render :new
    end
  end

  def update

    if @bukken.update(bukken_params)
      flash[:success] = "Bukken was successfully updated"
      redirect_to bukken_path(@bukken)
    else
      render 'edit'
  end
end

  def show

  end

  def destroy

    @bukken.destroy
    flash[:danger] = "Bukken was successfully deleted"
    redirect_to bukkens_path
  end

  private
    def set_bukken
      @bukken = Bukken.find(params[:id])
    end

    def bukken_params
      params.require(:bukken).permit(:title, :description)
    end

    def require_same_user
      if current_user != @bukken.user and !current_user.admin? #This sets it so that a logged in user can only edit his own bukkens
        flash[:danger] = "you can only edit or delete your own bukkens"
        redirect_to root_path
      end
    end

  end
