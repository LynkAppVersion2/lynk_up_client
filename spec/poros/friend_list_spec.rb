require "rails_helper"

RSpec.describe FriendList do
  let(:group) { LynkUpFacade.new.find_group(2) }

  it "Creates an object for a FriendList", :vcr do
    friendlist = group.friends
    expect(friendlist.first.id).to be_an(Integer)
    expect(friendlist.first.user_name).to be_a(String)
    expect(friendlist.first.phone_number).to be_a(String)
    expect(friendlist.first.full_name).to be_a(String)
    expect(friendlist.first.my_events).to be_an(EventList).or be_nil
    expect(friendlist.first.invited_to_events).to be_an(EventList).or be_nil
    expect(friendlist.first.my_groups).to be_an(GroupList).or be_nil
    expect(friendlist.first.included_in_groups).to be_an(GroupList).or be_nil
  end
end