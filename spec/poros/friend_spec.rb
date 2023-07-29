require "rails_helper"

RSpec.describe Friend do
  let(:friend) { LynkUpFacade.new.find_friend_for_user(1, 2) }

  it "Creates an object for a Friend", :vcr do
    expect(friend.id).to be_an(Integer)
    expect(friend.user_name).to be_a(String)
    expect(friend.phone_number).to be_a(String)
    expect(friend.full_name).to be_a(String)
    expect(friend.my_events).to be_an(Array)
    expect(friend.my_events.first).to be_an(EventListEvent).or be_nil
    expect(friend.invited_to_events).to be_an(Array)
    expect(friend.invited_to_events.first).to be_an(EventListEvent).or be_nil
    expect(friend.my_groups).to be_an(Array)
    expect(friend.my_groups.first).to be_a(GroupListGroup)
    expect(friend.included_in_groups).to be_an(Array)
    expect(friend.included_in_groups.first).to be_a(GroupListGroup)
  end
end