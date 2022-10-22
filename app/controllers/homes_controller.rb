class HomesController < ApplicationController
  
  def about
    @book = Book.all
  end
end
