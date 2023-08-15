require 'rails_helper'

RSpec.describe "Events Index" do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user7) { LynkUpFacade.new.find_user(7) }

    describe "When I visit my Events Index", :vcr do
      before do
        visit "/users/#{user.id}/events"
      end

      describe "I see an Events section" do
        it "With headings for each type of events section" do
          expect(page).to have_content("Events")
          expect(page).to have_content("My Events")
          expect(page).to have_content("Event Invitations")
        end

        describe "I see 'My Events'" do
          context "For each event" do
            it "I see the event info and name as a link to its show page" do
              event = user.my_events[0]

              within("#event-#{event.id}") do
                expect(page).to have_link("Root - A medium length game")
                expect(page).to have_content("9:00 PM")
                expect(page).to have_content("08-04-24")

                click_link "Root - A medium length game"
                expect(current_path).to eq("/users/#{user.id}/events/#{event.id}")
              end
            end

            it "If I have no events, I see 'No Events Created'" do
              visit "/users/#{user7.id}/dashboard"
              expect(page).to have_content("No Events Created")
            end
          end

          it "I see a button to create an event that takes me to a new page" do
            expect(page).to have_button("Create Event")
            click_button "Create Event"
            expect(current_path).to eq("/users/#{user.id}/events/new")
          end
        end

        describe "I see 'Invited to' events" do
          context "For each event" do
            it "I see the event info and name as a link to its show page" do
              event = user7.invited_to_events[1]

              within("#event-#{event.id}") do
                expect(page).to have_link("Denver Night Hang")
                expect(page).to have_content("8:00 PM")
                expect(page).to have_content("06-05-23")

                click_link "Denver Night Hang"
                expect(current_path).to eq("/users/#{user.id}/events/#{event.id}")
              end
            end

            it "If I have no events, I see 'No Event Invitations'" do
              visit "/users/#{user.id}/dashboard"
              expect(page).to have_content("No Event Invitations")
            end
          end
        end
      end
    end
  end
end