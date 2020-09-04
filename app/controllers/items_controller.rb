class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def items_params
    params_require(:item).permit(:content, :image).merge(user_id: current_user.id)
  end
end
