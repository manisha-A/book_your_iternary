require 'Capybara/cucumber'
require 'rspec/expectations'
require 'Capybara/rspec'
require 'pry'

screenshot_path = File.expand_path('../../features/test_report', File.dirname(__FILE__)) + '/screenshot_'+ Time.now.strftime("%H:%M:%S") + '.png'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = "http://travelfusion.com"
  config.default_wait_time = 10
end

RSpec.configure do |config|
  config.expect_with :rspec do |c|
    c.syntax = [:should]
  end
end

After do |scenario|
  if scenario.failed?
    save_screenshot screenshot_path
  end
end