# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :membership do
    user nil
    organization nil
    expires_at "2013-11-16"
    membership_type nil
  end
end
