require 'rails_helper'

RSpec.describe "Application Pages", type: :feature do
  describe "As a logged in User" do
    let!(:user) { LynkUpFacade.new.find_user(1) }
    let!(:user7) { LynkUpFacade.new.find_user(7) }

    describe "When I visit any page in my application", :vcr do
      before do
        visit "/users/#{user.id}/dashboard"
      end

      it "I see my full name" do
        visit "/users/#{user.id}/events"
        expect(page).to have_link("LynkUp")
        click_link "LynkUp"
        expect(current_path).to eq("/users/#{user.id}/dashboard")
      end

      describe "I see a Menu" do
        it "With links to events, groups, and friends" do
          expect(page).to have_link("Events")
          expect(page).to have_link("Groups")
          expect(page).to have_link("Friends")
        end
      end
    end
  end
end
