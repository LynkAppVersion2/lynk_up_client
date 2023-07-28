require "rails_helper"

RSpec.describe LynkUpFacade do
  describe "find_user", :vcr do
    let(:user) { LynkUpFacade.new.find_user(1) }

    it "finds a user by id" do
      expect(user).to be_a(User)
    end
  end

  describe "find_group", :vcr do
    let(:group) { LynkUpFacade.new.find_group(2) }

    it "finds a group by id" do
      expect(group).to be_a(Group)
    end
  end

  describe "find_friend_for_user", :vcr do
    let(:friend) { LynkUpFacade.new.find_friend_for_user(1, 2) }

    it "finds a friend for a user by user_id and friend_id" do
      expect(friend).to be_a(Friend)
    end
  end

  describe "find_event", :vcr do
    let(:event) { LynkUpFacade.new.find_event(4) }

    it "finds a friend for a user by user_id and friend_id" do
      expect(event).to be_an(Event)
    end
  end
end