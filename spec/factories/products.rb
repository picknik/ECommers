FactoryGirl.define do
  factory :product do
    sequence(:name){ |n| "Product_#{n}" }
    units_in_stock { rand(100..1000) }
    units_on_order { rand(1..5) }
    discount       { rand(0.1..0.3).round(2) }
    price          { rand(10..500) }
    reorder_level  { rand(10..100) }
  end
end
