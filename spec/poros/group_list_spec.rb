require "rails_helper"

RSpec.describe GroupList do
  let(:user) { LynkUpFacade.new.find_user(1) }

  it "Creates an object for a GroupList", :vcr do
    grouplist = user.my_groups
    expect(grouplist.first.id).to be_an(Integer)
    expect(grouplist.first.name).to be_a(String)
    expect(grouplist.first.member_count).to be_an(Integer)
  end
end