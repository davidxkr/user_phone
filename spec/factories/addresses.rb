FactoryGirl.define do
  factory :address do
    line1 { Faker::Address.street_name }
    zip { Faker::Address.zip_code }
  end
end