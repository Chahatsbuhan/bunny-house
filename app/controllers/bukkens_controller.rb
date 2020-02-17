class BukkensController < ApplicationController

  def index
    @bukkens = Bukken.all
  end

  def new
    @bukken = Bukken.new
  end

  def edit
    @bukken = Bukken.find(params[:id])
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
    @bukken = Bukken.find(params[:id])
    if @bukken.update(bukken_params)
      flash[:notice] = "Bukken was successfully updated"
      redirect_to bukken_path(@bukken)
    else
      render 'edit'
  end
end

  def show
    @bukken = Bukken.find(params[:id])
  end

  def destroy
    @bukken = Bukken.find(params[:id])
    @bukken.destroy
    flash[:notice] = "Bukken was successfully deleted"
    redirect_to bukkens_path
  end

  private
    def bukken_params
      params.require(:bukken).permit(:title, :description)
    end
  end
