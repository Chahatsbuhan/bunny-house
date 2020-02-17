class BukkensController < ApplicationController
  def new
    @bukken = Bukken.new
  end

  def create
    #render plain: params[:bukken].inspect
    @bukken = Bukken.new(bukken_params)
    @bukken.save
    redirect_to bukken_show(bukken)
  end

  private
    def bukken_params
      params.require(:bukken).permit(:title, :description)
    end

end
