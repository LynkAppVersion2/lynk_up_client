require "rails_helper"

RSpec.describe FriendListFriend do
  let(:group) { LynkUpFacade.new.find_group(2) }

  it "Creates an object for a FriendListFriend", :vcr do
    friendlistfriend = group.friends
    expect(friendlistfriend.first.id).to be_an(Integer)
    expect(friendlistfriend.first.user_name).to be_a(String)
    expect(friendlistfriend.first.phone_number).to be_a(String)
    expect(friendlistfriend.first.full_name).to be_a(String)
    expect(friendlistfriend.first.my_events).to be_an(EventListEvent).or be_nil
    expect(friendlistfriend.first.invited_to_events).to be_an(EventListEvent).or be_nil
    expect(friendlistfriend.first.my_groups).to be_an(GroupListGroup).or be_nil
    expect(friendlistfriend.first.included_in_groups).to be_an(GroupListGroup).or be_nil
  end
end