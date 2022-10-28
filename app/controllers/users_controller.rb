class UsersController < ApplicationController
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @user = User.find(params[:id])

  end
end
