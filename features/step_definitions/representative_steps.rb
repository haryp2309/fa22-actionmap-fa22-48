Given /the representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |representative|
    Representative.create!(name: representative[:name], ocdid: representative[:divisionId], title: representative[:office])
  end
end

Then /^I should see the representatives: (.*)$/ do |representative_list|
  representative_list.split(',').each do |representative|
    step "I should see #{representative}"
  end
end

When /^I navigate to the (.* County) in (.*)$/ do |county, state|
  state = State.find_by(name: state)
  visit search_representatives_path(address: 'San Francisco County CA')
end
