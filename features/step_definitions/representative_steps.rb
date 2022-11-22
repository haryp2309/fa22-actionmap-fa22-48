
Given /the representatives exist/ do |representatives_table|
  representatives_table.hashes.each do |representative|
    Representative.create!(name: representative[:name], ocdid: representative[:divisionId], 
    title: representative[:office])
  end
end


Then /^I should see the representatives: (.*)$/ do |representative_list|
  representative_list.split(',').each do |representative|
    step 'I should ' +'see ' + representative
  end
end

When /^I navigate to the (.* County) in (.*)$/ do |county, state|
  state = State.find_by(name: state)
  county = County.find_by(name: county, state: state)
  #visit county_path(state_symbol: state.symbol, std_fips_code: county.fips_code)
  visit search_representatives_path(address: 'San Francisco County CA')
end




