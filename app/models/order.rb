class Order < ApplicationRecord
  attr_accessor :token
  has_one :address
  belongs_to :user
  belongs_to :item

  # with_options presence: true do
  #   validates :user_id
  #   validates :item_id
end
