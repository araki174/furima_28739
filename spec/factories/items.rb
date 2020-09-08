FactoryBot.define do
  factory :item do
    item_img
    name      { 'jupiter' }
    introduction  { '木星' }
    genre_id
    itemcondition_id
    postagepayer_id
    prefecture_id
    preparationday_id
    price
  end
end
