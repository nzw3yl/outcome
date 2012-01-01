require 'factory_girl'

Factory.define :user do |u|
  u.sequence(:name)  {|p| "TestUser#{p}"} 
  u.sequence(:email) {|n| "person-#{n}@example.com"} 
  u.password 'please'
end

Factory.define :progress_metric do |g|
  g.sequence(:name)  {|q| "metric#{q}"} 
  g.direction true
  g.sequence(:symbol) {|j| "sym#{j}"}
  g.lang_code "en"
end

Factory.define :attainment do |a|
  a.name "rule the world"
  a.reason "it would be fun"
  a.due_date Time.now + 90.days
  a.target 100
  a.sequence(:code)  {|x| "code#{x}"} 
  a.public true
  a.user_id 2
end

Factory.define :work do |w|
  w.description "invade france"
  w.effort 100
  w.user_id 2
end

Factory.define :suggestion do |s|
  s.name "invade france"
  s.target 100
  s.user_id 2
  s.attainment_id  9
end
