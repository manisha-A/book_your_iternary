require 'selenium-webdriver'

Given(/^I am on home page$/) do
  HomePage.new(Capybara.current_session).navigateToHomePage
end

When(/^I search one way flight between "(.*?)" and "(.*?)"$/) do |source, destination|
  HomePage.new(Capybara.current_session).select_source(source)
  HomePage.new(Capybara.current_session).select_destination(destination)
  HomePage.new(Capybara.current_session).select_no_of_adults(2)
  HomePage.new(Capybara.current_session).search_flights
  sleep 15
end

Then(/^I should be able to view available flight options$/) do
  assert_text('Total Results:')
  #find('#flight_results').text.has_content?("Total Results:")
end
