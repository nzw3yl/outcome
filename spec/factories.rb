require 'factory_girl'

Factory.define :user do |u|
  u.name 'Test User'
  u.email 'user@test.com'
  u.password 'please'
end

Factory.define :attainment do |a|
  a.name "rule the world"
  a.reason "it would be fun"
  a.due_date Time.now + 90.days
  a.target 100
  a.code "RTW"
  a.public true
  a.association :user
end
