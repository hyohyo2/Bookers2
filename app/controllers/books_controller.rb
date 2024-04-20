class BooksController < ApplicationController


  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
  if @book.save
    redirect_to book_path(@book.id)
  else
    @books = Book.all
    render :show
  end
  end

  def index
    @books = Book.all
    @book = Book.find(params[:id])
    @user = @book.user

  end

  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path

  end

  def edit
    @book =Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@book.id)
  end

  #投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :caption)
  end
end
