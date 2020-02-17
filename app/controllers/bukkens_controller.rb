class BukkensController < ApplicationController
  def new
    @bukken = Bukken.new
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

  def show
    @bukken = Bukken.find(params[:id])
  end

  private
    def bukken_params
      params.require(:bukken).permit(:title, :description)
    end

end
