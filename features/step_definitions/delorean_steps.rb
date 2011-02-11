When /^(?:|I )time travel to (.+)$/ do |how_much_fluzo|
  #no tengo cojones de hacer que funcione la puta variable
  Delorean.time_travel_to(how_much_fluzo)
end

When /^(?:|I )move time to 45-minutes$/ do
  Delorean.time_travel_to(45.minutes.from_now)
end

When /^(?:|I )move time to 55-minutes$/ do
  Delorean.time_travel_to(55.minutes.from_now)
end

When /^(?:|I )move time to 1-day$/ do
  Delorean.time_travel_to(1.day.from_now)
end
