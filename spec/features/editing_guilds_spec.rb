require "rails_helper"

RSpec.feature "Guild masters can edit existing guilds" do
  let(:user) { FactoryGirl.create(:user) }
  let(:guild) { FactoryGirl.create(:guild, game: "The Elder Scrolls Online", 
                                   name: "Strategy and Company") }
  
  before do
    login_as(user)
    assign_role!(user, :guild_master, guild)

    visit "/"
    click_link "Strategy and Company"
    click_link "Edit Guild"
  end

  scenario "with valid attributes" do
    fill_in "Name", with: "Strats Co."
    click_button "Update Guild"

    expect(page).to have_content "Guild has been updated."
    expect(page).to have_content "Strats Co."
  end

  scenario "when providing invalid attributes" do
    fill_in "Name", with: ""
    click_button "Update Guild"

    expect(page).to have_content "Guild has not been updated."
  end
end
