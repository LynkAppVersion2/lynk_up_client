require "rails_helper"

RSpec.describe EventList do
  let(:user) { LynkUpFacade.new.find_user(1) }

  it "Creates an object for an EventList", :vcr do
    eventlist = user.my_events
    expect(eventlist.first.id).to be_an(Integer)
    expect(eventlist.first.group).to be_an(Integer)
    expect(eventlist.first.group_name).to be_a(String)
    expect(eventlist.first.title).to be_a(String)
    expect(eventlist.first.date).to be_a(String)
    expect(eventlist.first.time).to be_a(String)
  end
end