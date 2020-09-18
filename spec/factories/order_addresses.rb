FactoryBot.define do
  factory :order_address do
    user_id        { '1' }
    item_id        { '1' }

    postal_code    { '123-4567' }
    prefecture_id  { '1' }
    city           { '横浜市' }
    house_number   { '青葉区1-1-1' }
    building_name  { '城' }
    phone_number   { '09012345678' }

    token          { 'sh083ssbpwnnsykeknc' }
  end
end
