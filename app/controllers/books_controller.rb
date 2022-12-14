class BooksController < ApplicationController

  before_action :ensure_correct_user, only:[:edit, :update, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
   if @book.save
    redirect_to book_path(@book.id), notice: "You have created book successfully."
   else
    @user = current_user
    @books = Book.all
    render :index
   end
  end

  def index
    @user = current_user
    @books = Book.all
    @book = Book.new
  end

  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book), notice: "You have updated book successfully!"
    else
      flash.now[:danger] = "編集に失敗しました"
      render :edit
    end
  end


  def destroy
    @book = Book.find(params[:id])
    if @book.destroy
      redirect_to books_path, notice: "アウトプットを削除しました"
    else
      flash.now[:danger] = "削除に失敗しました"
      render 'show'
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :body, :image)
  end

  def ensure_correct_user
    @book = Book.find(params[:id])
    unless current_user == @book.user
      redirect_to books_path
    end
  end

end
