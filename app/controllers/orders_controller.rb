class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index
  before_action :move_to_session
  def index
   @order = OrderAddress.new
  end

  def new
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render :index
    end
  end 
  
  private

  def order_params
    params.permit(:token, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,           # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_session
    unless user_signed_in? && current_user.id != @item.user_id
      redirect_to user_session_path
    end
  end

  def move_to_index
    unless @item.order == nil
      redirect_to root_path
    end
  end

end
