class Page
  include RSpec::Matchers

  def initialize()
    @session = capybara.current_session
  end

  def verify_active_tab(tab_name)
    expect(@session.find('#flight_breadcrumbs .active').text).to eq(tab_name)
  end

  def wait_for_element_to_be_present(selector)
    if(@session.has_css?("#{selector}"))
      sleep 4
    end
  end
end

module PageHelpers
  def homepage
    HomePage.new(Capybara.current_session,self)
  end

  def resultpage
    ResultPage.new(Capybara.current_session,self)
  end
end
World(PageHelpers)