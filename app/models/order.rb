class Order < ApplicationRecord
  attr_accessor :token
  has_one :address
  belongs_to :user
  belongs_to :item

  # validates :price, presence: true
  # validates :token, presence: true
end
