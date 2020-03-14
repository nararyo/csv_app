require './app/models/import_csv.rb'

class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    User.create(user_params)

  end

  def show
    @user = User.find(params[:id])

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    User.create(user_params)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end
  
 #csvの情報をインポートするアクション
  def csv_data
    @users = Import.users_data
  end

private
  def user_params
    params.require(:user).permit(:name, :age, :address)
  end



end