FactoryGirl.define do
  factory :user do
    first_name "Bob"
    last_name "Boberson"
    city "Halifax"
    province "Nova Scotia"
    # Don't know if I really need sequence here
    # Maybe just ensure none of the other user creates use this email ???
    sequence :email do |n|
      "#{first_name}#{n}@example.com"
    end
    password "password"
    password_confirmation "password"
    role_ids ["2"] # TODO fix this ?
    dob "2016/6/16"
  end
end
