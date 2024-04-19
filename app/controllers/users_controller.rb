class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
  end
  
  #ユーザデータのストロングパラメータ
  private
  
  def user_params
    params.require(:user).permit(:name, :image)
    
  end
  
end
