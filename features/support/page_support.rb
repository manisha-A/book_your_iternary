class Page
  def initialize(capybara)
    @capybara = capybara
    @session = capybara.current_session
  end
end

module PageHelpers
  def homepage
    HomePage.new(Capybara.current_session,self)
  end
end

World(PageHelpers)