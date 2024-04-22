class BooksController < ApplicationController


  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
  if @new_book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@new_book.id)
  else
    @books = Book.all
    @user = current_user
    render :index
  end
  end

  def index
    @books = Book.all
    @user = current_user
    @new_book = Book.new

  end

  def show
    @book_user = current_user.id
    @book = Book.find(params[:id])
    @user = @book.user
    @users = User.all
    @new_book = Book.new
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
  if @book.update(book_params)
    flash[:notice] = "You have updated book successfully."
    redirect_to book_path(@book.id)
  else
    render :edit
  end
  end

  #投稿データのストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :Body)
  end
end
