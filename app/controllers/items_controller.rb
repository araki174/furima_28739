class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show, :destroy]
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
    @item.update(item_params)
    if @item.update
      redirect_to item_path
    else
      render :edit
    end
  end

  def show
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :item_condition_id, :postage_payer_id, :prefecture_id, :preparation_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
