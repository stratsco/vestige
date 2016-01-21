require "rails_helper"

RSpec.feature "Users can create new guilds" do
  scenario "with valid attributes" do
    visit "/"

    click_link "Create New Guild"

    fill_in "Game", with: "The Elder Scrolls Online"
    fill_in "Name", with: "Strategy and Company"
    fill_in "Server", with: "North American"
    fill_in "Affiliation", with: "Daggerfall"
    click_button "Create Guild"

    expect(page).to have_content "Guild has been created."
  end
end
