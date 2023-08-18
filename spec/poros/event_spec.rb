require "rails_helper"

RSpec.describe Event do
  let(:event) { LynkUpFacade.new.find_event(1) }

  it "Creates an object for an Event", :vcr do
    expect(event.id).to be_an(Integer)
    expect(event.group_id).to be_an(Integer)
    expect(event.group_name).to be_a(String)
    expect(event.title).to be_a(String)
    expect(event.date_time).to be_a(String)
    expect(event.formatted_datetime).to be_a(String)
    expect(event.address).to be_a(String)
    expect(event.description).to be_a(String)
    expect(event.invited).to be_an(Array)
    expect(event.invited.first).to be_a(FriendListFriend)

  end
end