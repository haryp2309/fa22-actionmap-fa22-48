# frozen_string_literal: true

Then /^I should see: (.*)$/ do |event_list|
  event_list.split(',').each do |event|
    step "I should see #{event}"
  end
end

When /I navigate to the events page/ do
  visit events_path
end

When /I navigate to the new events page/ do
  visit new_my_event_path
end
