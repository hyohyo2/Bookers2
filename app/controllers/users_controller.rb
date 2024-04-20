class UsersController < ApplicationController
  def index
    @users= User.all

  end

  def show
    @user = User.find(params[:id])
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
