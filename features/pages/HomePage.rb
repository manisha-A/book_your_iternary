class HomePage < Page

  def initialize(session, world)
    @session = session
  end

  def navigate_to_home_page
    @session.visit ('/')
    should_be_on_home_page
  end

  def select_no_of_adults(no_of_adults)
    @session.select(no_of_adults, from: 'form_adults')
  end

  def select_departure_date
    @session.fill_in('form_startdate', :with => Date.today)
  end

  def select_source(source)
    fill_in_city("form_city_from", source)
  end

  def select_destination(destination)
    fill_in_city("form_city", destination)
  end

  def search_flights
    @session.click_button('Search')
  end

  def should_be_on_home_page
    verify_active_tab("Search")
    @session.text.include? "Flight Search"
  end

  def should_be_on_result_tab
    result_content = "#flight_results"
    verify_active_tab("Results")
    wait_for_element_to_be_present(result_content)

    if (@session.find('#content_field').text == "No Results Found")
      (@session.find('#flight_results').text.include? "Total Results:").should == false
    else
      (@session.find('#flight_results').text.include? "Total Results:").should == true
    end
  end

  def verify_active_tab(tab_name)
    @session.find('#flight_breadcrumbs .active').text.should == tab_name
  end

  def verify_minimum_adults
    message_for_minimum_no_adult = "Select at least one passenger OK"
    verify_message(".fancybox-inner",message_for_minimum_no_adult)
  end

  private
  def fill_in_city(selector, airport)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
    @session.fill_in("#{selector}", :with => airport)
    @session.driver.browser.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
    sleep 2
  end

  def verify_message(selector,message)
    @session.find("#{selector}").text.should == message
  end

  def wait_for_element_to_be_present(selector)
    if(@session.has_css?("#{selector}"))
      sleep 4
    end
  end

end