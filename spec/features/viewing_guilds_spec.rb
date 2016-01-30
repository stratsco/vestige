require "rails_helper"

RSpec.feature "users can view guilds" do
  let(:user) { FactoryGirl.create(:user) }
  let(:guild) { FactoryGirl.create(:guild, game: "The Elder Scrolls Online",
                                   name: "Strategy and Company") }

  before do
    login_as(user)
    assign_role!(user, :member, guild)
  end

  scenario "with the guild details" do
    visit "/"
    click_link "Strategy and Company"
    expect(page.current_url).to eq guild_url(guild)
  end
end
