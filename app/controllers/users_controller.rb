class UsersController < ApplicationController

  def index
    @users = User.all
    puts "index"*10
  end

  def show
    @user = User.find(params[:id])
    puts "show"*10
  end
end
