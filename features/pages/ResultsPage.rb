class ResultPage < Page
  def initialize(session, world)
    @session = session
  end

  def should_be_on_result_tab
    #result_content = "#flight_results"
    verify_active_tab("Results")
    #wait_for_element_to_be_present(result_content)
    @session.find("#flight_results .flight_box", match: :first)

    if (@session.find('#content_field').text == "No Results Found")
      expect((@session.find('#flight_results').text.include? "Total Results:")).to eq(false)
    else
      expect(@session.find('#flight_results').text.include? "Total Results:").to eq(true)
    end
  end
end