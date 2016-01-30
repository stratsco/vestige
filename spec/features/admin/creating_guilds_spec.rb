require "rails_helper"

RSpec.feature "Users can create new guilds" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
    visit "/"

    click_link "Create Guild"
  end

  scenario "with valid attributes" do
    fill_in "Game", with: "The Elder Scrolls Online"
    fill_in "Name", with: "Strategy and Company"
    fill_in "Server", with: "North American"
    fill_in "Affiliation", with: "Daggerfall"
    click_button "Create Guild"

    expect(page).to have_content "Guild has been created."
    
    guild = Guild.find_by(name: "Strategy and Company")
    expect(page.current_url).to eq guild_url(guild)

    title = "Strategy and Company - Guilds - Vestige"
    expect(page).to have_title title

  end

  scenario "with invalid attributes" do
    click_button "Create Guild"

    expect(page).to have_content "Guild has not been created."
    expect(page).to have_content "Game can't be blank"
    expect(page).to have_content "Name can't be blank"
  end
end
