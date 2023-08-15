require 'rails_helper'

RSpec.describe "Users Dashboard" do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user2) { LynkUpFacade.new.find_user(2) }


    describe "When I visit my dashboard", :vcr do
      before do
        visit "/users/#{user.id}/dashboard"
      end

      it "I see my full name" do
        expect(page).to have_content("Andra Helton")
      end

      describe "I see an Events section" do
        it "I see the 'Events' title over the section" do
          expect(page).to have_content("Events")
        end

        describe "I see 'My Events'" do
          context "For each event" do
            it "I see the event name, date, and time" do
              within("#event-#{user.my_events[0].id}") do
                expect(page).to have_content("Root - A medium length game")
                expect(page).to have_content("9:00 PM")
                expect(page).to have_content("08-04-24")
              end
            end

            it "If I have no events, I see 'No Events Scheduled'" do
              visit "/users/#{user2.id}/dashboard"
              expect(page).to have_content("No Events Scheduled")
            end

          end
        end
        # describe "I see 'Invited to' events"
      end
    end
  end
end