class PagesController < ApplicationController

  def home
    redirect_to bukkens_path if logged_in?
  end

  def about

  end

end
