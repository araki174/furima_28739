class OrderAddress

  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number


  def save
    binding.pry
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

  with_options presence: true do
    validates :postal_code,   format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id, format: { with: /[^0]/ }
    validates :city,          format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :house_number   
    validates :phone_number,  format: {with: /\A[0-9０−９]{11}\z/}

    validates :user_id
    validates :item_id
    validates :token
  end

end