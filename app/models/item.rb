class Item < ApplicationRecord
  has_one_attached :image
  # belongs_toはnull falseを持つためvalidates :user_idが不要
  belongs_to :user

  with_options presence: true do

    validates :image
    validates :name, length: {maximum: 40 }
    validates :introduction,length: {maximum: 1000 }
    validates :genre_id, format: { with: /[^0]/}
    validates :itemcondition_id, format: { with: /[^0]/}
    validates :postagepayer_id, format: { with: /[^0]/}
    validates :prefecture_id, format: { with: /[^0]/}
    validates :preparationday_id, format: { with: /[^0]/}
    validates :price, length: {minimum: 3, maxinum: 7}, numericality: { only_integer: true, greater_than: 300, less_than: 10000000 } 
    #lengthで桁数の制限をかけている  #numericalityで数字以外が使われていないか検証  #less_thanで9999999以下の制限をかける
  end

end