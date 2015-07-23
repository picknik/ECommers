FactoryGirl.define do
  factory :supplier do
    sequence(:company_name)  { |n| "company_name_#{n}" }
    sequence(:contact_name)  { |n| "contact_name_#{n}" }
    sequence(:contact_title) { |n| "contact_title_#{n}" }
    sequence(:address)       { |n| "address_#{n}" }
    sequence(:city)          { |n| "city_#{n}" }
    sequence(:region)        { |n| "region_#{n}" }
    sequence(:postal_code)   { |n| "postal_code_#{n}" }
    sequence(:phone)         { |n| "phone_#{n}" }
    sequence(:skype)         { |n| "skype_#{n}" }
    sequence(:fax)           { |n| "fax_#{n}" }
    sequence(:home_page)     { |n| "home_page_#{n}" }
  end
end
