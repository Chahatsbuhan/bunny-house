class BukkensController < ApplicationController
  before_action :set_bukken, only: [:edit, :update, :show, :destroy]

  def index
    @bukkens = Bukken.all
  end

  def new
    @bukken = Bukken.new
  end

  def edit

  end

  def create
    @bukken = Bukken.new(bukken_params)
    if @bukken.save
      flash[:notice] = "Bukken was successfully created"
      redirect_to bukken_path(@bukken)
    else
      render :new
    end
  end

  def update

    if @bukken.update(bukken_params)
      flash[:notice] = "Bukken was successfully updated"
      redirect_to bukken_path(@bukken)
    else
      render 'edit'
  end
end

  def show

  end

  def destroy

    @bukken.destroy
    flash[:notice] = "Bukken was successfully deleted"
    redirect_to bukkens_path
  end

  private
    def set_bukken
      @bukken = Bukken.find(params[:id])
    end

    def bukken_params
      params.require(:bukken).permit(:title, :description)
    end
  end
