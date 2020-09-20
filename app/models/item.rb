class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  has_one :order, dependent: :destroy
  has_one :address
  has_one_attached :image
  # belongs_toはnull falseを持つためvalidates :user_idが不要
  belongs_to :user
  belongs_to_active_hash :genre
  belongs_to_active_hash :item_condition
  belongs_to_active_hash :postage_payer
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :preparation_day

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :introduction, length: { maximum: 1000 }
    validates :genre_id, format: { with: /[^0]/ }
    validates :item_condition_id, format: { with: /[^0]/ }
    validates :postage_payer_id, format: { with: /[^0]/ }
    validates :prefecture_id, format: { with: /[^0]/ }
    validates :preparation_day_id, format: { with: /[^0]/ }
    validates :price, length: { minimum: 3, maxinum: 7 }, numericality: { only_integer: true, greater_than: 300, less_than: 10_000_000 }
    # lengthで桁数の制限をかけている  #numericalityで数字以外が使われていないか検証  #less_thanで9999999以下の制限をかける
  end
end
