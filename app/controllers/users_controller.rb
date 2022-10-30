class UsersController < ApplicationController

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.all
    #@post_images = @user.post_images.page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path, notice:"You have updated user successfully!"
    else
      flash.now[:danger] = "編集に失敗しました"
    render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end


  end
