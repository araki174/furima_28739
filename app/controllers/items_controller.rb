class ItemsController < ApplicationController
  def index
    @item = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      return  redirect_to root_path
    else
      render "new"
    end

  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :itemcondition_id, :postagepayer_id, :prefecture_id, :preparationday_id, :price).merge(user_id: current_user.id)
  end
end
