class UsersController < ApplicationController
  def index
    @users= User.all
    @user = User.find(params[:id])
    @new_book = Book.new
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    @new_book = Book.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end

  #ユーザデータのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image)

  end

end
