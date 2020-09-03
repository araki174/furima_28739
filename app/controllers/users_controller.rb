class UsersController < ApplicationController
  def index
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @email = current_user.email
  end
end
