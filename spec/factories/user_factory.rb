FactoryGirl.define do
  factory :user do
    name "bob"
    email "bob@gmail.com"
    password "123456"
    password_confirmation "123456"
  end
end
