require 'selenium-webdriver'

Given(/^I am on home page$/) do
  homepage.navigateToHomePage
end

When(/^I search one way flight between "(.*?)" and "(.*?)" for (\d+) adults$/) do |source, destination, no_of_adults|
  homepage.select_source(source)
  homepage.select_destination(destination)
  homepage.select_no_of_adults(no_of_adults)
  homepage.search_flights
  sleep 15
end

Then(/^I should be able to view available flight options$/) do
  assert page.has_content?('Total Results:'),"error"
  assert_text('Total Results:')
  #find('#flight_results').text.has_content?("Total Results:")
end
