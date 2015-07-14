FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }

    factory :invalid_user do
      name nil
    end
  end
end