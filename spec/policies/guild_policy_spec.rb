require 'rails_helper'

RSpec.describe GuildPolicy do

  let(:user) { User.new }

  subject { GuildPolicy }

  permissions :show? do
    let(:user) { FactoryGirl.create :user }
    let(:guild) { FactoryGirl.create :guild }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, guild)
    end

    it "allows members of the guild" do
      assign_role!(user, :member, guild)
      expect(subject).to permit(user, guild)
    end

    it "allows officers of the guild" do
      assign_role!(user, :officer, guild)
      expect(subject).to permit(user, guild)
    end
    
    it "allows master of the guild" do
      assign_role!(user, :guild_master, guild)
      expect(subject).to permit(user, guild)
    end

    it "allows administrators" do
      admin = FactoryGirl.create :user, :admin
      expect(subject).to permit(admin, guild)
    end

    it "doesn't allow users assigned to other guilds" do
      other_guild = FactoryGirl.create :guild
      assign_role!(user, :guild_master, other_guild)
      expect(subject).not_to permit(user, guild)
    end
  end
  
  permissions :update? do
    let(:user) { FactoryGirl.create :user }
    let(:guild) { FactoryGirl.create :guild }

    it "blocks anonymous users" do
      expect(subject).not_to permit(nil, guild)
    end

    it "doesn't allow members of the guild" do
      assign_role!(user, :member, guild)
      expect(subject).not_to permit(user, guild)
    end

    it "doesn't allow officers of the guild" do
      assign_role!(user, :officer, guild)
      expect(subject).not_to permit(user, guild)
    end
    
    it "allows master of the guild" do
      assign_role!(user, :guild_master, guild)
      expect(subject).to permit(user, guild)
    end

    it "allows administrators" do
      admin = FactoryGirl.create :user, :admin
      expect(subject).to permit(admin, guild)
    end

    it "doesn't allow users assigned to other guilds" do
      other_guild = FactoryGirl.create :guild
      assign_role!(user, :guild_master, other_guild)
      expect(subject).not_to permit(user, guild)
    end
  end
end
