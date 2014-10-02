class HomePage < Page

  def initialize(session,world)
    @session = session
  end

  def navigateToHomePage
    @session.visit ('/')
    should_be_on_home_page
  end

  def select_no_of_adults(no_of_adults)
    @session.select(no_of_adults, from: 'form_adults')
  end

  def select_departure_date
    #tom = Date.today + 1
    #p tom
    #binding.pry
    @session.fill_in('form_startdate', :with => Date.today)
  end

  def select_source(source)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
    @session.fill_in('form_city_from',:with => source)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
    sleep 2
  end

  def select_destination(destination)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
    @session.fill_in('form_city',:with => destination)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
    sleep 1
  end

  def search_flights
    @session.click_button('Search')
  end

  def should_be_on_home_page
    @session.text.include? "Flight Search"
  end

  def should_be_on_result_tab
    until(@session.find('#flight_results').visible?)do
      if (@session.find('#flight_results').text.include? "Total Results:")
      else
        @session.find('#flight_results').text.include? "No Results Found"
        p "There are no flights available"
      end
    end

  end
end