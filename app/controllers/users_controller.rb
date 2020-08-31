class UsersController < ApplicationController
  def index
  end

  def edit
  end

  def show
    user = User.find(params[:id])
    @nickname = current_user.nickname
    @email = current_user.email
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).parmit(:user, :email)
  end
end
