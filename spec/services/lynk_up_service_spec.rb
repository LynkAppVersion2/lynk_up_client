require "rails_helper"

RSpec.describe LynkUpService do 
  describe "get_user", :vcr do 
    let(:user) { LynkUpService.new.get_user(1) }

    it "returns a user json object" do
      expect(user).to be_a(Hash)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data].keys).to eq([:id, :type, :attributes])
      expect(user[:data][:id]).to be_an(Integer)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes].keys).to eq([:user_name, :phone_number, :full_name, :my_events, :invited_to_events, :my_groups, :included_in_groups])
      expect(user[:data][:attributes][:user_name]).to be_a(String)
      expect(user[:data][:attributes][:phone_number]).to be_a(String)
      expect(user[:data][:attributes][:full_name]).to be_a(String)
      expect(user[:data][:attributes][:my_events]).to be_an(Array)
      expect(user[:data][:attributes][:my_events][0]).to be_a(Hash)
      expect(user[:data][:attributes][:my_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(user[:data][:attributes][:my_events][0][:id]).to be_an(Integer)
      expect(user[:data][:attributes][:my_events][0][:group]).to be_an(Integer)
      expect(user[:data][:attributes][:my_events][0][:group_name]).to be_a(String)
      expect(user[:data][:attributes][:my_events][0][:title]).to be_a(String)
      expect(user[:data][:attributes][:my_events][0][:date]).to be_a(String)
      expect(user[:data][:attributes][:my_events][0][:time]).to be_a(String)
      expect(user[:data][:attributes][:invited_to_events]).to be_an(Array)
      expect(user[:data][:attributes][:my_groups]).to be_an(Array)
      expect(user[:data][:attributes][:my_groups][0]).to be_a(Hash)
      expect(user[:data][:attributes][:my_groups][0].keys).to eq([:id, :name, :member_count])
      expect(user[:data][:attributes][:my_groups][0][:id]).to be_an(Integer)
      expect(user[:data][:attributes][:my_groups][0][:name]).to be_a(String)
      expect(user[:data][:attributes][:my_groups][0][:member_count]).to be_an(Integer)
      expect(user[:data][:attributes][:included_in_groups]).to be_an(Array)
    end
  end

  describe "get_all_users", :vcr do 
    let(:user) { LynkUpService.new.get_all_users }

    it "returns users json object" do
      expect(user).to be_a(Hash)
      expect(user[:data]).to be_an(Array)
      expect(user[:data][0].keys).to eq([:id, :type, :attributes])
      expect(user[:data][0][:id]).to be_an(Integer)
      expect(user[:data][0][:type]).to eq("user")
      expect(user[:data][0][:attributes]).to be_a(Hash)
      expect(user[:data][0][:attributes].keys).to eq([:user_name, :phone_number, :full_name, :my_events, :invited_to_events, :my_groups, :included_in_groups])
      expect(user[:data][0][:attributes][:user_name]).to be_a(String)
      expect(user[:data][0][:attributes][:phone_number]).to be_a(String)
      expect(user[:data][0][:attributes][:full_name]).to be_a(String)
      expect(user[:data][0][:attributes][:my_events]).to be_an(Array)
      expect(user[:data][0][:attributes][:my_events][0]).to be_a(Hash)
      expect(user[:data][0][:attributes][:my_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(user[:data][0][:attributes][:my_events][0][:id]).to be_an(Integer)
      expect(user[:data][0][:attributes][:my_events][0][:group]).to be_an(Integer)
      expect(user[:data][0][:attributes][:my_events][0][:group_name]).to be_a(String)
      expect(user[:data][0][:attributes][:my_events][0][:title]).to be_a(String)
      expect(user[:data][0][:attributes][:my_events][0][:date]).to be_a(String)
      expect(user[:data][0][:attributes][:my_events][0][:time]).to be_a(String)
      expect(user[:data][2][:attributes][:invited_to_events]).to be_an(Array)
      expect(user[:data][2][:attributes][:invited_to_events][0]).to be_a(Hash)
      expect(user[:data][2][:attributes][:invited_to_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(user[:data][2][:attributes][:invited_to_events][0][:id]).to be_an(Integer)
      expect(user[:data][2][:attributes][:invited_to_events][0][:group]).to be_an(Integer)
      expect(user[:data][2][:attributes][:invited_to_events][0][:group_name]).to be_a(String)
      expect(user[:data][2][:attributes][:invited_to_events][0][:title]).to be_a(String)
      expect(user[:data][2][:attributes][:invited_to_events][0][:date]).to be_a(String)
      expect(user[:data][2][:attributes][:invited_to_events][0][:time]).to be_a(String)
      expect(user[:data][0][:attributes][:my_groups]).to be_an(Array)
      expect(user[:data][0][:attributes][:my_groups][0]).to be_a(Hash)
      expect(user[:data][0][:attributes][:my_groups][0].keys).to eq([:id, :name, :member_count])
      expect(user[:data][0][:attributes][:my_groups][0][:id]).to be_an(Integer)
      expect(user[:data][0][:attributes][:my_groups][0][:name]).to be_a(String)
      expect(user[:data][0][:attributes][:my_groups][0][:member_count]).to be_an(Integer)
      expect(user[:data][2][:attributes][:included_in_groups]).to be_an(Array)
      expect(user[:data][2][:attributes][:included_in_groups][0]).to be_a(Hash)
      expect(user[:data][2][:attributes][:included_in_groups][0].keys).to eq([:id, :name, :member_count])
      expect(user[:data][2][:attributes][:included_in_groups][0][:id]).to be_an(Integer)
      expect(user[:data][2][:attributes][:included_in_groups][0][:name]).to be_a(String)
      expect(user[:data][2][:attributes][:included_in_groups][0][:member_count]).to be_an(Integer)
    end
  end

  describe "update_user", :vcr do
    let(:user) { LynkUpService.new.update_user(1) }

    it "returns updated user json object" do
      expect(user).to be_a(Hash)
      expect(user.keys).to eq([:id, :type, :attributes])
      expect(user[:id]).to be_an(Integer)
      expect(user[:type]).to be_a(String)
      expect(user[:attributes]).to be_a(Hash)
      expect(user[:attributes].keys).to eq([:user_name, :phone_number, :full_name, :my_events, :invited_to_events, :my_groups, :included_in_groups])
      expect(user[:attributes][:user_name]).to be_a(String)
      expect(user[:attributes][:phone_number]).to be_a(String)
      expect(user[:attributes][:full_name]).to be_a(String)
      expect(user[:attributes][:my_events]).to be_an(Array)
      expect(user[:attributes][:my_events][0]).to be_a(Hash)
      expect(user[:attributes][:my_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(user[:attributes][:my_events][0][:id]).to be_an(Integer)
      expect(user[:attributes][:my_events][0][:group]).to be_an(Integer)
      expect(user[:attributes][:my_events][0][:group_name]).to be_a(String)
      expect(user[:attributes][:my_events][0][:title]).to be_a(String)
      expect(user[:attributes][:my_events][0][:date]).to be_a(String)
      expect(user[:attributes][:my_events][0][:time]).to be_a(String)
      expect(user[:attributes][:invited_to_events]).to be_an(Array)
      expect(user[:attributes][:my_groups]).to be_an(Array)
      expect(user[:attributes][:my_groups][0]).to be_a(Hash)
      expect(user[:attributes][:my_groups][0].keys).to eq([:id, :name, :member_count])
      expect(user[:attributes][:my_groups][0][:id]).to be_an(Integer)
      expect(user[:attributes][:my_groups][0][:name]).to be_a(String)
      expect(user[:attributes][:my_groups][0][:member_count]).to be_an(Integer)
      expect(user[:attributes][:included_in_groups]).to be_an(Array)
    end
  end

  describe "get_friends_for_user`", :vcr do 
    let(:user_friends) { LynkUpService.new.get_friends_for_user(1) }

    it "returns a user friends json object" do
      expect(user_friends).to be_a(Hash)
      expect(user_friends[:data]).to be_a(Hash)
      expect(user_friends[:data].keys).to eq([:friends])
      expect(user_friends[:data][:friends]).to be_an(Array)
      expect(user_friends[:data][:friends].size).to eq(5)
      expect(user_friends[:data][:friends][0]).to be_a(Hash)
      expect(user_friends[:data][:friends][0].keys).to eq([:user_id, :user_name, :full_name, :phone_number])
      expect(user_friends[:data][:friends][0][:user_id]).to be_an(Integer)
      expect(user_friends[:data][:friends][0][:user_name]).to be_a(String)
      expect(user_friends[:data][:friends][0][:full_name]).to be_a(String)
      expect(user_friends[:data][:friends][0][:phone_number]).to be_a(String)
    end
  end

  describe "get_friend_for_user", :vcr do
    let(:user_friend) { LynkUpService.new.get_friend_for_user(1, 6) }

    it "returns a user friend json object" do
      expect(user_friend).to be_a(Hash)
      expect(user_friend[:data]).to be_a(Hash)
      expect(user_friend[:data].keys).to eq([:id, :type, :attributes])
      expect(user_friend[:data][:id]).to be_an(Integer)
      expect(user_friend[:data][:type]).to be_a(String)
      expect(user_friend[:data][:attributes]).to be_a(Hash)
      expect(user_friend[:data][:attributes].keys).to eq([:user_name, :phone_number, :full_name, :my_events, :invited_to_events, :my_groups, :included_in_groups])
      expect(user_friend[:data][:attributes][:user_name]).to be_a(String)
      expect(user_friend[:data][:attributes][:phone_number]).to be_a(String)
      expect(user_friend[:data][:attributes][:full_name]).to be_a(String)
      expect(user_friend[:data][:attributes][:my_events]).to be_an(Array)
      expect(user_friend[:data][:attributes][:invited_to_events]).to be_an(Array)
      expect(user_friend[:data][:attributes][:my_groups]).to be_an(Array)
      expect(user_friend[:data][:attributes][:included_in_groups]).to be_an(Array)
    end
  end

  describe "get_all_groups", :vcr do 
    let(:groups) { LynkUpService.new.get_all_groups }

    it "returns groups json object" do
      expect(groups).to be_a(Hash)
      expect(groups[:data]).to be_an(Array)
      expect(groups[:data][0]).to be_a(Hash)
      expect(groups[:data][0].keys).to eq([:id, :type, :attributes])
      expect(groups[:data][0][:id]).to be_an(Integer)
      expect(groups[:data][0][:type]).to eq('group')
      expect(groups[:data][0][:attributes]).to be_a(Hash)
      expect(groups[:data][0][:attributes].keys).to eq([:group_host_id, :group_host_name, :group_name, :group_friends, :group_events])
      expect(groups[:data][0][:attributes][:group_host_id]).to be_an(Integer)
      expect(groups[:data][0][:attributes][:group_host_name]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_name]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_friends]).to be_an(Array)
      expect(groups[:data][0][:attributes][:group_friends][0].keys).to eq([:user_id, :user_name, :full_name, :phone_number])
      expect(groups[:data][0][:attributes][:group_friends][0][:user_id]).to be_an(Integer)
      expect(groups[:data][0][:attributes][:group_friends][0][:user_name]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_friends][0][:full_name]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_friends][0][:phone_number]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_events]).to be_an(Array)
      expect(groups[:data][0][:attributes][:group_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(groups[:data][0][:attributes][:group_events][0][:id]).to be_an(Integer)
      expect(groups[:data][0][:attributes][:group_events][0][:group]).to be_an(Integer)
      expect(groups[:data][0][:attributes][:group_events][0][:group_name]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_events][0][:title]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_events][0][:date]).to be_a(String)
      expect(groups[:data][0][:attributes][:group_events][0][:time]).to be_a(String)
    end
  end

  describe "get_group", :vcr do 
    let(:group) { LynkUpService.new.get_group(1) }

    it "returns a group json object" do
      expect(group).to be_a(Hash)
      expect(group[:data]).to be_a(Hash)
      expect(group[:data].keys).to eq([:id, :type, :attributes])
      expect(group[:data][:id]).to be_an(Integer)
      expect(group[:data][:type]).to eq('group')
      expect(group[:data][:attributes]).to be_a(Hash)
      expect(group[:data][:attributes].keys).to eq([:group_host_id, :group_host_name, :group_name, :group_friends, :group_events])
      expect(group[:data][:attributes][:group_host_id]).to be_an(Integer)
      expect(group[:data][:attributes][:group_host_name]).to be_a(String)
      expect(group[:data][:attributes][:group_name]).to be_a(String)
      expect(group[:data][:attributes][:group_friends]).to be_an(Array)
      expect(group[:data][:attributes][:group_friends][0]).to be_a(Hash)
      expect(group[:data][:attributes][:group_friends][0].keys).to eq([:user_id, :user_name, :full_name, :phone_number])
      expect(group[:data][:attributes][:group_friends][0][:user_id]).to be_an(Integer)
      expect(group[:data][:attributes][:group_friends][0][:user_name]).to be_a(String)
      expect(group[:data][:attributes][:group_friends][0][:full_name]).to be_a(String)
      expect(group[:data][:attributes][:group_friends][0][:phone_number]).to be_a(String)
      expect(group[:data][:attributes][:group_events]).to be_an(Array)
      expect(group[:data][:attributes][:group_events][0]).to be_a(Hash)
      expect(group[:data][:attributes][:group_events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(group[:data][:attributes][:group_events][0][:id]).to be_an(Integer)
      expect(group[:data][:attributes][:group_events][0][:group]).to be_an(Integer)
      expect(group[:data][:attributes][:group_events][0][:group_name]).to be_a(String)
      expect(group[:data][:attributes][:group_events][0][:title]).to be_a(String)
      expect(group[:data][:attributes][:group_events][0][:date]).to be_a(String)
      expect(group[:data][:attributes][:group_events][0][:time]).to be_a(String)
    end
  end

  describe "get_all_events", :vcr do 
    let(:events) { LynkUpService.new.get_all_events }

    it "returns events json object" do
      expect(events).to be_a(Hash)
      expect(events[:data]).to be_an(Array)
      expect(events[:data][0][:id]).to be_an(Integer)
      expect(events[:data][0][:group]).to be_an(Integer)
      expect(events[:data][0][:group_name]).to be_a(String)
      expect(events[:data][0][:title]).to be_a(String)
      expect(events[:data][0][:date]).to be_a(String)
      expect(events[:data][0][:time]).to be_a(String)
      expect(events[:data][0][:address]).to be_a(String)
      expect(events[:data][0][:description]).to be_a(String)
    end
  end

  describe "get_event", :vcr do
    let (:event) { LynkUpService.new.get_event(1) }

    it "returns an event json object" do
      expect(event).to be_a(Hash)
      expect(event[:data]).to be_a(Hash)
      expect(event[:data].keys).to eq([:id, :group, :group_name, :host_id, :host_name, :title, :date, :time, :address, :description, :invited])
      expect(event[:data][:id]).to be_an(Integer)
      expect(event[:data][:group]).to be_an(Integer)
      expect(event[:data][:group_name]).to be_a(String)
      expect(event[:data][:host_id]).to be_an(Integer)
      expect(event[:data][:host_name]).to be_a(String)
      expect(event[:data][:title]).to be_a(String)
      expect(event[:data][:date]).to be_a(String)
      expect(event[:data][:time]).to be_a(String)
      expect(event[:data][:address]).to be_a(String)
      expect(event[:data][:description]).to be_a(String)
      expect(event[:data][:invited]).to be_an(Array)
      expect(event[:data][:invited][0]).to be_a(Hash)
      expect(event[:data][:invited][0].keys).to eq([:user_id, :user_name, :full_name, :phone_number])
      expect(event[:data][:invited][0][:user_id]).to be_an(Integer)
      expect(event[:data][:invited][0][:user_name]).to be_a(String)
      expect(event[:data][:invited][0][:full_name]).to be_a(String)
      expect(event[:data][:invited][0][:phone_number]).to be_a(String)
    end
  end
end