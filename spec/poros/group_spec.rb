require "rails_helper"

RSpec.describe Group do
  let(:group) { LynkUpFacade.new.find_group(2) }

  it "Creates an object for a Group", :vcr do
    expect(group.id).to be_an(Integer)
    expect(group.host_id).to be_an(Integer)
    expect(group.host_name).to be_a(String)
    expect(group.name).to be_a(String)
    expect(group.friends).to be_an(Array)
    expect(group.friends.first).to be_a(FriendListFriend)
    expect(group.events).to be_an(Array)
    expect(group.events.first).to be_an(EventListEvent)
  end
end