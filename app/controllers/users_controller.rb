class UsersController < ApplicationController
  def index
    @users= User.all
    @user = current_user
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
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  #ユーザデータのストロングパラメータ
  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)

  end

end
