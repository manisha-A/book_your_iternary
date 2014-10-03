class ResultPage < Page
  def initialize(session, world)
    @session = session
  end

  def should_be_on_result_tab
    verify_active_tab("Results")
    expect(@session.find("#flight_results")).to be
  end
end