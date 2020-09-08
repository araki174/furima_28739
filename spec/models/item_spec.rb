require 'rails_helper'

RSpec.describe Item, type: :model do

  describe '新規商品出品' do
    context '出品がうまくとき' do
      it 'item_img、name、introduction、genre、itemcondition、postagepayer、prefecture、preparationday、priceがあれば出品できる' do
        expect(@itme).to be_valid
      end
      it 'priceが300円〜9999999円であれば出品できる' do
        @item.price = '5000'
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'item_imgが空だと出品できない' do
        # @item.item_img = ''
        # @item.valid?

      end
      it 'nameが空だと出品できない' do
      end
      it 'nameが40文字以上だと出品できない' do
      end
      it 'introductionが空だと出品できない' do
      end
      it 'introductionが1000文字以上だと出品できない' do
      end
      it 'genreが未選択だと出品できない' do
      end
      it 'postagepayerが未選択だと出品できない' do
      end
      it 'prefectureが未選択だと出品できない' do
      end
      it 'preparationdayが未選択だと出品できない' do
      end
      it 'priceが未選択だと出品できない' do
      end
      it 'priceが数字以外だと出品できない' do
      end
      it 'priceが300円以下もしくは9999999円以上だと出品できない' do
      end
    end
  end
end
