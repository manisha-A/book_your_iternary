require 'Capybara/cucumber'

screenshot_path = File.expand_path('../../features/test_report', File.dirname(__FILE__)) + '/screenshot_'+ Time.now.strftime("%H:%M:%S") + '.png'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.default_wait_time = 10
end

After do |scenario|
  if scenario.failed?
    save_screenshot screenshot_path
  end
end