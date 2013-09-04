FactoryGirl.define do
  factory :user do
    name     "Rob Dey"
    email    "robdey@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end