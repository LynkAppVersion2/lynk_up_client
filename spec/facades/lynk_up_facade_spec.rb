require "rails_helper"

RSpec.describe LynkUpFacade do
  describe "find_user", :vcr do
    let(:user) { LynkUpFacade.new.find_user(1) }

    it "finds a user by id" do
      expect(user).to be_a(User)
      expect(user.full_name).to be_a(String)
      expect(user.id).to be_an(Integer)
      expect(user.included_in_groups).to be_an(Array)
      expect(user.invited_to_events).to be_an(Array)
      expect(user.my_events).to be_an(Array)
      expect(user.my_events.first).to be_an(EventListEvent)
      expect(user.my_groups).to be_an(Array)
      expect(user.my_groups.first).to be_a(GroupListGroup)
      expect(user.phone_number).to be_a(String)
      expect(user.user_name).to be_a(String)
    end
  end

  describe "find_all_users", :vcr do
    let (:users) { LynkUpFacade.new.find_all_users }

    it "finds all users" do
      user = users.first
      expect(users).to be_an(Array)
      expect(user).to be_a(User)
      expect(user.full_name).to be_a(String)
      expect(user.id).to be_an(Integer)
      expect(user.included_in_groups).to be_an(Array)
      expect(user.invited_to_events).to be_an(Array)
      expect(user.my_events).to be_an(Array)
      expect(user.my_events.first).to be_an(EventListEvent)
      expect(user.my_groups).to be_an(Array)
      expect(user.my_groups.first).to be_a(GroupListGroup)
      expect(user.phone_number).to be_a(String)
      expect(user.user_name).to be_a(String)
    end
  end

  describe "change_user_info", :vcr do
    new_params = { user_name: "andra123", phone_number: "999-999-9999", full_name: "Andra Helton" }
    let (:user) { LynkUpFacade.new.change_user_info(1, new_params) }

    it "changes user info based on params" do
      expect(user).to be_a(User)
      expect(user.full_name).to be_a(String)
      expect(user.full_name).to eq("Andra Helton")
      expect(user.id).to be_an(Integer)
      expect(user.included_in_groups).to be_an(Array)
      expect(user.invited_to_events).to be_an(Array)
      expect(user.my_events).to be_an(Array)
      expect(user.my_events.first).to be_an(EventListEvent)
      expect(user.my_groups).to be_an(Array)
      expect(user.my_groups.first).to be_a(GroupListGroup)
      expect(user.phone_number).to be_a(String)
      expect(user.phone_number).to eq("999-999-9999")
      expect(user.user_name).to be_a(String)
      expect(user.user_name).to eq("andra123")
    end
  end

  describe "find_group", :vcr do
    let(:group) { LynkUpFacade.new.find_group(2) }

    it "finds a group by id" do
      expect(group).to be_a(Group)
      expect(group.events).to be_an(Array)
      expect(group.events.first).to be_an(EventListEvent)
      expect(group.friends).to be_an(Array)
      expect(group.friends.first).to be_a(FriendListFriend)
      expect(group.host_id).to be_an(Integer)
      expect(group.host_name).to be_a(String)
      expect(group.id).to be_an(Integer)
      expect(group.name).to be_a(String)
    end
  end

  describe "find_group_friends", :vcr do
    let(:friends) { LynkUpFacade.new.find_group_friends(1) }

    it "finds all friends in a group by group id" do
      expect(friends).to be_an(Array)
      expect(friends[0]).to be_a(Friend)
      expect(friends[0].id).to be_an(Integer)
      expect(friends[0].full_name).to be_a(String)
      expect(friends[0].user_name).to be_a(String)
      expect(friends[0].my_groups).to be_an(Array)
      expect(friends[0].included_in_groups).to be_an(Array)
      expect(friends[0].my_events).to be_an(Array)
      expect(friends[0].invited_to_events).to be_an(Array)
      expect(friends[0].phone_number).to be_a(String)
    end
  end

  describe "find_all_groups", :vcr do
    let(:groups) { LynkUpFacade.new.find_all_groups }

    it "finds all groups" do
      group = groups.first
      expect(groups).to be_an(Array)
      expect(group).to be_a(Group)
      expect(group.events).to be_an(Array)
      expect(group.events.first).to be_an(EventListEvent)
      expect(group.friends).to be_an(Array)
      expect(group.friends.first).to be_a(FriendListFriend)
      expect(group.host_id).to be_an(Integer)
      expect(group.host_name).to be_a(String)
      expect(group.id).to be_an(Integer)
      expect(group.name).to be_a(String)
    end
  end

  # describe "change_groups_info", :vcr do
  #   new_params = { name: "Roller Bladers", friends_list: [{friend_id: 5}] }
  #   let(:group) { LynkUpFacade.new.change_group_info(4, new_params) }

  #   it "updates an existing group based on params" do
  #     require 'pry'; binding.pry
  #     expect(group).to be_a(Group)
  #     expect(group.events).to be_an(Array)
  #     expect(group.friends).to be_an(Array)
  #     expect(group.friends.first).to be_a(FriendList)
  #     expect(group.host_id).to be_an(Integer)
  #     expect(group.host_name).to be_a(String)
  #     expect(group.id).to be_an(Integer)
  #     expect(group.name).to be_a(String)
  #   end
  # end

  describe "find_all_user_friends", :vcr do
    let(:friends) { LynkUpFacade.new.find_all_user_friends(1) }

    it "finds all friends associated with a user by id" do
      friend = friends.first
      expect(friends).to be_an(Array)
      expect(friend).to be_a(FriendListFriend)
      expect(friend.full_name).to be_a(String)
      expect(friend.id).to be_an(Integer)
      expect(friend.included_in_groups).to be_an(Array).or be_nil
      expect(friend.invited_to_events).to be_an(Array).or be_nil
      expect(friend.my_events).to be_an(Array).or be_nil
      expect(friend.my_groups).to be_an(Array).or be_nil
      expect(friend.phone_number).to be_a(String)
      expect(friend.user_name).to be_a(String)
    end
  end

  describe "find_friend_for_user", :vcr do
    let(:friend2) { LynkUpFacade.new.find_friend_for_user(1, 2) }
    let(:friend3) { LynkUpFacade.new.find_friend_for_user(1, 3) }

    it "finds a friend for a user by user_id and friend_id" do
      expect(friend2).to be_a(Friend)
      expect(friend2.full_name).to be_a(String)
      expect(friend2.id).to be_an(Integer)
      expect(friend3.included_in_groups).to be_an(Array)
      expect(friend3.included_in_groups.first).to be_a(GroupListGroup)
      expect(friend2.invited_to_events).to be_an(Array)
      expect(friend2.my_events).to be_an(Array)
      expect(friend2.my_groups).to be_an(Array)
      expect(friend2.my_groups.first).to be_a(GroupListGroup)
      expect(friend2.phone_number).to be_a(String)
      expect(friend2.user_name).to be_a(String)
    end
  end

  describe "find_event", :vcr do
    let(:event) { LynkUpFacade.new.find_event(1) }

    it "finds an event by id" do
      expect(event).to be_an(Event)
      expect(event.address).to be_a(String)
      expect(event.date_time).to be_a(String)
      expect(event.description).to be_a(String)
      expect(event.group_id).to be_an(Integer)
      expect(event.group_name).to be_a(String)
      expect(event.id).to be_an(Integer)
      expect(event.invited).to be_an(Array)
      expect(event.invited.first).to be_a(FriendListFriend)
      expect(event.title).to be_a(String)
    end
  end

  describe "find_all_events", :vcr do
    let(:events) { LynkUpFacade.new.find_all_events }

    it "finds all events" do
      event = events.first
      expect(events).to be_an(Array)
      expect(event).to be_an(Event)
      expect(event.address).to be_a(String)
      expect(event.date_time).to be_a(String)
      expect(event.description).to be_a(String)
      expect(event.group_id).to be_an(Integer)
      expect(event.group_name).to be_a(String)
      expect(event.id).to be_an(Integer)
      expect(event.invited).to be_an(Array)
      expect(event.invited.first).to be_a(FriendListFriend)
      expect(event.title).to be_a(String)
    end
  end

  describe "change_event_info", :vcr do
    new_params = {title: "Reunion - First Annual", date_time: "2024-07-01T16:00:00Z", address: "321 another address St.", description: "BYOB, arrive on time"}
    let(:event) { LynkUpFacade.new.change_event_info(9, new_params) }

    it "updates event info based on params" do
      expect(event).to be_an(Event)
      expect(event.address).to be_a(String)
      expect(event.date_time).to be_a(String)
      expect(event.description).to be_a(String)
      expect(event.group_id).to be_an(Integer)
      expect(event.group_name).to be_a(String)
      expect(event.id).to be_an(Integer)
      expect(event.invited).to be_an(Array)
      expect(event.invited.first).to be_a(FriendListFriend)
      expect(event.title).to be_a(String)
    end
  end
end