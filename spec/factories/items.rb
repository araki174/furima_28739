FactoryBot.define do

  factory :item do
    name                { '木星' }
    introduction        { '木星だよ' }
    genre_id            { '1' }
    itemcondition_id    { '1' }
    postagepayer_id     { '1' }
    prefecture_id       { '1' }
    preparationday_id   { '1' }
    price               { '1000' }
    
    association :user
  end

end
