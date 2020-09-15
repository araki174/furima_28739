class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  def index
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to item_path
    else
      render 'index'
    end
  end
  
  private

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to controller: :items, action: :index
    end
  end

end
