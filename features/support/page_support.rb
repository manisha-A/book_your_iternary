class Page
  def initialize()
    @session = capybara.current_session
  end
end

module PageHelpers
  def homepage
    HomePage.new(Capybara.current_session,self)
  end

  def current_page
    Page.new().page_content
  end
end

World(PageHelpers)