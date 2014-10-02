require 'selenium-webdriver'

Given(/^I am on home page$/) do
  visit Capybara.app_host
end

When(/^I search one way flight between "(.*?)" and "(.*?)"$/) do |arg1, arg2|
  source = @browser.find_element(:id,'form_city_from')
  source.send_keys("Atlanta, United States (city)")
  source.send_keys :enter

  destination = @browser.find_element(:id,'form_city')
  destination.send_key("London Heathrow Airport [LHR], United Kingdom (airport)")
  destination.send_keys :enter

  no_of_passengers = @browser.find_element(:id,'form_adults')
  no_of_passengers.send_keys(2)

  @browser.find_element(:xpath,'/html/body/div[2]/div[2]/table/tbody/tr/td/div[1]/form/div[4]/div/button').click
  sleep 2
end

Then(/^I should be able to view available flight options$/) do
  wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  results_header = wait.until{ @browser.find_element(:id,'flight_results')}
  assert results_header.text.include?("Total Results:"),"Unable to find result header"
  @browser.quit
end
