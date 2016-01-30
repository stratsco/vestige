require 'rails_helper'

RSpec.feature "Admins can manage a user's roles" do
  let(:admin) { FactoryGirl.create(:user, :admin) }
  let(:user) { FactoryGirl.create(:user) }

  let!(:teso) { FactoryGirl.create(:guild, game: "The Elder Scrolls Online",
                                   name: "Strategy and Company") }
  let!(:gta) { FactoryGirl.create(:guild, game: "Grand Theft Auto 5", 
                                  name: "Strats and Crew") }

  before do
    login_as(admin)
  end

  scenario "when assigning roles to an existing user" do
    visit admin_user_path(user)
    click_link "Edit User"

    select "Member", from: "Strategy and Company"
    select "Guild Master", from: "Strats and Crew"

    click_button "Update User"
    expect(page).to have_content "User has been updated."

    click_link user.email
    expect(page).to have_content "Strategy and Company: Member"
    expect(page).to have_content "Strats and Crew: Guild Master"
  end

  scenario "when assigning roles to a new user" do
    visit new_admin_user_path

    fill_in "Email", with: "newuser@vestige.com"
    fill_in "Password", with: "password"

    select "Officer", from: "Strategy and Company"
    click_button "Create User"

    click_link "newuser@vestige.com"
    expect(page).to have_content "Strategy and Company: Officer"
    expect(page).not_to have_content "Strats and Crew"
  end
end
