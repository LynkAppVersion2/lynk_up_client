require 'rails_helper'

RSpec.describe "Users Dashboard" do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user7) { LynkUpFacade.new.find_user(7) }

    describe "When I visit my dashboard", :vcr do
      before do
        visit "/users/#{user.id}/dashboard"
      end

      # describe "I see an Upcoming Events section" do
      #   context "For each event" do
      #     it "I see the event info and name as a link to its show page" do
      #       event = user.my_events[0]

      #       within("#event-#{event.id}") do
      #         expect(page).to have_link("Root - A medium length game")
      #         expect(page).to have_content("9:00 PM")
      #         expect(page).to have_content("08-04-24")

      #         click_link "Root - A medium length game"
      #         expect(current_path).to eq("/users/#{user.id}/events/#{event.id}")
      #       end
      #     end

      #     it "If I have no events, I see 'No Events Created'" do
      #       visit "/users/#{user7.id}/dashboard"
      #       expect(page).to have_content("No Events Created")
      #     end
      #   end
      # end
    end
  end
end