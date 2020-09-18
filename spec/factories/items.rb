FactoryBot.define do
  factory :item do
    name                { '木星' }
    introduction        { '木星だよ' }
    genre_id            { '1' }
    item_condition_id    { '1' }
    postage_payer_id     { '1' }
    prefecture_id { '1' }
    preparation_day_id { '1' }
    price { '1000' }

    association :user
  end
end
