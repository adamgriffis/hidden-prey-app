FactoryGirl.define do
  factory :player do
    email 'test@test.com'
    username 'test'
    password 'changeme'
    password_confirmation 'changeme'
    confirmed_at Time.now
  end
end