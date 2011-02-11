Factory.define :user do |u|
  u.email 'user@test.com'
  u.password '123456'
  u.password_confirmation '123456'
  u.activation_code nil
  u.activated_at    DateTime.now
  u.admin false
end

Factory.define :admin, :class => User do |u|
  u.email 'admin@test.com'
  u.password '123456'
  u.password_confirmation '123456'
  u.activation_code nil
  u.activated_at DateTime.now
  u.admin true
end
