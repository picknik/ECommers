FactoryGirl.define do
  factory :category do
    sequence(:name)        { |n| "category_#{n}" }
    sequence(:description) { |n| "description_#{n}" }
  end
end
