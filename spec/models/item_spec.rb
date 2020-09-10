require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload("/files/test_image.jpg")

  end

  describe '新規商品出品' do
    context '出品がうまくとき' do
      it 'name、introduction、genre、itemcondition、postagepayer、prefecture、preparationday、price、imageがあれば出品できる' do
        expect(@item).to be_valid
      end
    end

    context '出品がうまくいかないとき' do
      it 'item_imgが空だと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'nameが40文字以上だと出品できない' do
        @item.name = Faker::Name.initials(number: 50)
        @item.valid?
        expect(@item.errors.full_messages).to include("Name is too long (maximum is 40 characters)")
      end
      it 'introductionが空だと出品できない' do
        @item.introduction = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'introductionが1000文字以上だと出品できない' do
        @item.introduction = ("aa" * 10000)
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction is too long (maximum is 1000 characters)")
      end
      it 'genreが未選択だと出品できない' do
        @item.genre_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blank")
      end
      it 'postagepayerが未選択だと出品できない' do
        @item.postagepayer_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Postagepayer can't be blank")
      end
      it 'prefectureが未選択だと出品できない' do
        @item.prefecture_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'preparationdayが未選択だと出品できない' do
        @item.preparationday_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Preparationday can't be blank")
      end
      it 'priceが未記入だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが数字以外だと出品できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが300円未満だと出品できない' do
        @item.price = '200'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it 'priceが10000000円以上だと出品できない' do
        @item.price = '10000001'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 10000000")
      end
    end
  end
end
