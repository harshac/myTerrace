# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :availability do
    date Date.parse("14 Jan 2015")
    association :terrace
  end
end
