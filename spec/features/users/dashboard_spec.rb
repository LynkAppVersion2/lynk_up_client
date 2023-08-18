require 'rails_helper'

RSpec.describe "Users Dashboard" do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user_all_events) { LynkUpFacade.new.combine_events(user.my_events, user.invited_to_events) }
    let!(:user2) { LynkUpFacade.new.find_user(2) }

    describe "When I visit my dashboard", :vcr do
      before do
        visit "/users/#{user.id}/dashboard"
      end

      describe "I see an Upcoming Events section" do
        before do
          user_upcoming_events = LynkUpFacade.new.upcoming_events(user_all_events) 
          @event = user_upcoming_events[0]
        end
        
        context "For each event" do
          it "I see the event info and name as a link to its show page" do
            
            within("#event-#{@event.id}") do
              expect(page).to have_link("Wing Night")
              expect(page).to have_content("Wed May 01, 2024 at 06:00 PM")

              click_link "Wing Night"
              expect(current_path).to eq("/users/#{user.id}/events/#{@event.id}")
            end
          end
          
          it "If I have no events, I see 'No Upcoming Events'" do
            visit "/users/#{user2.id}/dashboard"
            expect(page).to have_content("No Upcoming Events")
          end
        end
      end
      
      describe "I see a Past Events section" do
        before do
          user_past_events = LynkUpFacade.new.past_events(user_all_events) 
          @event = user_past_events[0]
        end

        context "For each event" do
          it "I see the event info and name as a link to its show page" do

            within("#event-#{@event.id}") do
              expect(page).to have_link("Renaissance Festival Afterparty")
              expect(page).to have_content("Wed June 07, 2023 at 06:00 PM")

              click_link "Renaissance Festival Afterparty"
              expect(current_path).to eq("/users/#{user.id}/events/#{@event.id}")
            end
          end

          it "If I have no events, I see 'No Past Events'" do
            visit "/users/#{user2.id}/dashboard"
            expect(page).to have_content("No Past Events")
          end
        end
      end
    end
  end
end