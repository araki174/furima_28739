require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入時の配送先、購入者情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'building_nameが空でも保存できること' do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end

    it 'tokenが空だと保存できない' do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空だと保存できない' do
      @order_address.postal_code = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
      @order_address.postal_code = '1234567'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end

    it 'prefectureが未選択だと出品できない' do
      @order_address.prefecture_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
    end

    it 'cityが空だと保存できない' do
      @order_address.city = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank", 'City is invalid')
    end

    it 'house_numberが空だと保存できない' do
      @order_address.house_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberはハイフンが無く11文字以内でないと保存できない' do
      @order_address.phone_number = '090-1234-5678'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include('Phone number is invalid')
    end

    it 'user_idが空だと保存できない' do
      @order_address.user_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end

    it 'item_idが空だと保存できない' do
      @order_address.item_id = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
  end
end
