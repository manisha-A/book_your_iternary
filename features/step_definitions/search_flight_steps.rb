Given(/^I am on home page$/) do
  homepage.navigate_to_home_page
end

When(/^I search one way flight between "(.*?)" and "(.*?)" for today for (\d+) adults$/) do |source, destination, no_of_adults|
  homepage.select_source(source)
  homepage.select_destination(destination)
  homepage.select_departure_date
  homepage.select_no_of_adults(no_of_adults)
  homepage.search_flights
end

Then(/^I should be able to view available flight options$/) do
  resultpage.should_be_on_result_tab
end

Then(/^I should see appropriate message to select atleast one adult$/) do
  homepage.verify_minimum_adults
end
