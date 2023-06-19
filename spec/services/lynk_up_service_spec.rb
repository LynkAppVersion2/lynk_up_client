require "rails_helper"

RSpec.describe LynkUpService do 
  describe "Gets one user", :vcr do 
    let(:user) {LynkUpService.new.get_user(1) }

    it "returns a user json object" do
      expect(user).to be_a(Hash)
      expect(user[:data]).to be_a(Hash)
      expect(user[:data].keys).to eq([:id, :type, :attributes])
      expect(user[:data][:id]).to be_an(Integer)
      expect(user[:data][:type]).to be_a(String)
      expect(user[:data][:attributes]).to be_a(Hash)
      expect(user[:data][:attributes].keys).to eq([:user_name, :phone_number, :full_name, :events, :groups])
      expect(user[:data][:attributes][:user_name]).to be_a(String)
      expect(user[:data][:attributes][:phone_number]).to be_a(String)
      expect(user[:data][:attributes][:full_name]).to be_a(String)
      expect(user[:data][:attributes][:events]).to be_an(Array)
      expect(user[:data][:attributes][:events].size).to eq(5)
      expect(user[:data][:attributes][:groups]).to be_an(Array)
      expect(user[:data][:attributes][:groups].size).to eq(2)
    end
  end

  describe "Gets all users", :vcr do 
    let(:user) {LynkUpService.new.get_all_users }

    it "returns a user json object" do
      expect(user).to be_a(Hash)
      expect(user[:data]).to be_an(Array)
      expect(user[:data][0].keys).to eq([:id, :type, :attributes])
      expect(user[:data][0][:id]).to be_an(Integer)
      expect(user[:data][0][:type]).to eq("user")
      expect(user[:data][0][:attributes]).to be_a(Hash)
      expect(user[:data][0][:attributes].keys).to eq([:user_name, :phone_number, :full_name, :events, :groups])
      expect(user[:data][0][:attributes][:user_name]).to be_a(String)
      expect(user[:data][0][:attributes][:phone_number]).to be_a(String)
      expect(user[:data][0][:attributes][:full_name]).to be_a(String)
      expect(user[:data][0][:attributes][:events]).to be_an(Array)
      expect(user[:data][0][:attributes][:events][0]).to be_a(Hash)
      expect(user[:data][0][:attributes][:events][0].keys).to eq([:id, :group, :group_name, :title, :date, :time])
      expect(user[:data][0][:attributes][:events][0][:id]).to be_an(Integer)
      expect(user[:data][0][:attributes][:events][0][:group]).to be_an(Integer)
      expect(user[:data][0][:attributes][:events][0][:group_name]).to be_a(String)
      expect(user[:data][0][:attributes][:events][0][:title]).to be_a(String)
      expect(user[:data][0][:attributes][:events][0][:date]).to be_a(String)
      expect(user[:data][0][:attributes][:events][0][:time]).to be_a(String)
      expect(user[:data][0][:attributes][:groups]).to be_an(Array)
      expect(user[:data][0][:attributes][:groups][0]).to be_a(Hash)
      expect(user[:data][0][:attributes][:groups][0].keys).to eq([:id, :name])
      expect(user[:data][0][:attributes][:groups][0][:id]).to be_an(Integer)
      expect(user[:data][0][:attributes][:groups][0][:name]).to be_a(String)
    end
  end
end