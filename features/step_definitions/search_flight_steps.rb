require 'selenium-webdriver'

Given(/^I am on home page$/) do
  visit Capybara.app_host
end

When(/^I search one way flight between "(.*?)" and "(.*?)"$/) do |source, destination|
  fill_in('form_city_from',:with => source)
  fill_in('form_city',:with => destination)
  select(2 , :from =>'form_adults')
  click_button('Search')
  sleep 15
end

Then(/^I should be able to view available flight options$/) do
  assert_text('Total Results:')
  #find('#flight_results').text.has_content?("Total Results:")
end
