require "rails_helper"

RSpec.feature "Users can delete guilds" do
  before do
    login_as(FactoryGirl.create(:user, :admin))
  end
  scenario "successfully" do
    FactoryGirl.create(:guild, game: "The Elder Scrolls Online", 
                        name: "Strategy and Company")

    visit "/"
    click_link "Strategy and Company"
    click_link "Delete Guild"

    expect(page).to have_content "Guild has been deleted."
    expect(page.current_url).to eq guilds_url
    expect(page).to have_no_content "Strategy and Company"
  end
end
