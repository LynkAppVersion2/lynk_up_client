require 'rails_helper'

RSpec.describe "Events Index" do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user_my_events_sorted) { LynkUpFacade.new.sort_events(user.my_events) }
    let!(:user_invited_events_sorted) { LynkUpFacade.new.sort_events(user.invited_to_events) }
    
    let!(:user3) { LynkUpFacade.new.find_user(3) }
    let!(:user3_invited_events_sorted) { LynkUpFacade.new.sort_events(user3.invited_to_events) }

    let!(:user2) { LynkUpFacade.new.find_user(2) }

    let!(:user6) { LynkUpFacade.new.find_user(6) }
    let!(:user6_invited_events_sorted) { LynkUpFacade.new.sort_events(user6.invited_to_events) }


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
          it "I see a button to create an event that takes me to a new page" do
            expect(page).to have_button("Create Event")
            click_button "Create Event"
            expect(current_path).to eq("/users/#{user.id}/events/new")
          end

          describe "My Upcoming Events" do
            before do
              my_upcoming_events = LynkUpFacade.new.upcoming_events(user_my_events_sorted)
              @event = my_upcoming_events[0]
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
  
              it "If I have no events, I see 'No Events Created'" do
                visit "/users/#{user2.id}/events/"
                expect(page).to have_content("No Events Created")
              end
            end
          end
        end

        describe "My Past Events" do
          before do
            my_past_events = LynkUpFacade.new.past_events(user_my_events_sorted)
            @event = my_past_events[0]
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

            it "If I have no events, I see 'No Events Created'" do
              visit "/users/#{user2.id}/events/"
              expect(page).to have_content("No Events Created")
            end
          end
        end

        describe "I see 'Invited to' events" do
          before do
            invited_upcoming_events = LynkUpFacade.new.upcoming_events(user6_invited_events_sorted)
            @event = invited_upcoming_events[0]
          end

          describe "Upcoming Event Invitations" do
            context "For each event" do
              it "I see the event info and name as a link to its show page" do
                visit "/users/#{user6.id}/events/"

                within("#event-#{@event.id}") do
                  expect(page).to have_link("Wing Night")
                  expect(page).to have_content("Wed May 01, 2024 at 06:00 PM")
  
                  click_link "Wing Night"
                  expect(current_path).to eq("/users/#{user6.id}/events/#{@event.id}")
                end
              end
  
              it "If I have no events, I see 'No Event Invitations'" do
                visit "/users/#{user2.id}/events/"
                expect(page).to have_content("No Event Invitations")
              end
            end
          end

          describe "Past Event Invitations" do
            before do
              invited_past_events = LynkUpFacade.new.past_events(user3_invited_events_sorted)
              @event = invited_past_events[0]
            end

            context "For each event" do
              it "I see the event info and name as a link to its show page" do
                visit "/users/#{user3.id}/events/"

                within("#event-#{@event.id}") do
                  expect(page).to have_link("Root")
                  expect(page).to have_content("Sat June 03, 2023 at 08:00 PM")
  
                  click_link "Root"
                  expect(current_path).to eq("/users/#{user3.id}/events/#{@event.id}")
                end
              end
  
              it "If I have no events, I see 'No Event Invitations'" do
                visit "/users/#{user2.id}/events/"
                expect(page).to have_content("No Event Invitations")
              end
            end
          end
        end
      end
    end
  end
end