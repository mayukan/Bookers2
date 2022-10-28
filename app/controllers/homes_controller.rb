class HomesController < ApplicationController

  def about
    @book = Book.all
  end
  
  def index
    @user = User.find(params[:id])
  end

end
