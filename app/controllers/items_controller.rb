class ItemsController < ApplicationController
  def index
    @item = Item.all
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

    # @name = Name.create params.require(:name).permit(content, :item)
    # redirect_to @name

  end

  def edit
  end

  def update
    # @name = Name.find(params[:id])
    # @name.update params.require(:name).permit(:content, :image)
    # redirect_to @name
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :introduction, :genre_id, :itemcondition_id, :postagepayer_id, :prefecture_id, :preparationday_id, :price).merge(user_id: current_user.id)
  end
end
