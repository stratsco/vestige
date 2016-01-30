require "rails_helper"

RSpec.feature "User can only see the appropriate links" do
  let(:guild) { FactoryGirl.create(:guild) }
  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:user, :admin) }

  context "anonymous users" do
    scenario "cannnot see the Create Guild link" do
      visit "/"
      expect(page).not_to have_link "Create Guild"
    end
  end

  context "non-admin users (guild members)" do
    before do
      login_as(user)
      assign_role!(user, :member, guild)
    end

    scenario "cannot see the Create Guild link" do
      visit "/"
      expect(page).not_to have_link "Create Guild" 
    end
    
    scenario "cannot see the Delete Guild link" do
      visit guild_path(guild)
      expect(page).not_to have_link "Delete Guild"
    end

    scenario "cannot see the Edit Guild link" do
      visit guild_path(guild)
      expect(page).not_to have_link "Edit Guild"
    end
  end

  context "admin users" do
    before { login_as(admin) }

    scenario "can see the Create Guild link" do
      visit "/"
      expect(page).to have_link "Create Guild"
    end

    scenario "can see the Delete Guild link" do
      visit guild_path(guild)
      expect(page).to have_link "Delete Guild"
    end

    scenario "can see the Edit Guild link" do
      visit guild_path(guild)
      expect(page).to have_link "Edit Guild"
    end
  end
end
