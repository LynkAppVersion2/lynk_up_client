require "rails_helper"

RSpec.describe User do
  let(:user) { LynkUpFacade.new.find_user(1) }

  it "Creates an object for a User", :vcr do
    expect(user.id).to be_an(Integer)
    expect(user.user_name).to be_a(String)
    expect(user.phone_number).to be_a(String)
    expect(user.full_name).to be_a(String)
    expect(user.my_events).to be_an(Array)
    expect(user.my_events.first).to be_an(EventList)
    expect(user.invited_to_events).to be_an(Array)
    expect(user.invited_to_events.last).to be_an(EventList).or be_nil
    expect(user.my_groups).to be_an(Array)
    expect(user.my_groups.first).to be_a(GroupList).or be_nil
    expect(user.included_in_groups).to be_an(Array)
    expect(user.included_in_groups.first).to be_a(GroupList).or be_nil
  end
end