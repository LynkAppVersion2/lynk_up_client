require "rails_helper"

RSpec.describe GroupListGroup do
  let(:user) { LynkUpFacade.new.find_user(1) }

  it "Creates an object for a GroupListGroup", :vcr do
    grouplistgroup = user.my_groups
    expect(grouplistgroup.first.id).to be_an(Integer)
    expect(grouplistgroup.first.name).to be_a(String)
    expect(grouplistgroup.first.member_count).to be_an(Integer)
  end
end