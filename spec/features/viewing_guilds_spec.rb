require "rails_helper"

RSpec.feature "users can view projects" do
  scenario "with the guild details" do
    guild = FactoryGirl.create(:guild, game: "The Elder Scrolls Online",
                               name: "Strategy and Company")

    visit "/"
    click_link "Strategy and Company"
    expect(page.current_url).to eq guild_url(guild)
  end
end
