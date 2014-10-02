require 'Capybara/cucumber'

class HomePage

  def initialize(session)
    @session = session
  end

  def navigateToHomePage
    @session.visit "http://travelfusion.com"
  end

  def select_no_of_adults(no_of_adults)
    @session.select(no_of_adults, from: 'form_adults')
  end

  def select_source(source)
    @session.fill_in('form_city_from',:with => source)
  end

  def select_destination(destination)
    @session.fill_in('form_city',:with => destination)
  end

  def search_flights
      @session.click_button('Search')
  end
end