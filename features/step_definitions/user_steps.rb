# frozen_string_literal: true

When /I am signed in as a ([^\s]*) user/ do |provider|
  steps 'Given I am on the login page'
  steps "And I press \"Sign in with #{provider}\""
end
