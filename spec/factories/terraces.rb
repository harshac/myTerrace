# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :terrace do
    association :owner
    rent 3000.1
    area 1002
    location "ahmedabad pol"
    capacity 20
  end
end
