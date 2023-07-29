require "rails_helper"

RSpec.describe EventListEvent do
  let(:user) { LynkUpFacade.new.find_user(1) }

  it "Creates an object for an EventListEvent", :vcr do
    eventlistevent = user.my_events
    expect(eventlistevent.first.id).to be_an(Integer)
    expect(eventlistevent.first.group).to be_an(Integer)
    expect(eventlistevent.first.group_name).to be_a(String)
    expect(eventlistevent.first.title).to be_a(String)
    expect(eventlistevent.first.date).to be_a(String)
    expect(eventlistevent.first.time).to be_a(String)
  end
end