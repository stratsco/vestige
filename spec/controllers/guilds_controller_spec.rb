require 'rails_helper'

RSpec.describe GuildsController, type: :controller do
  it "handles a missing guild correctly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(guilds_path)

    message = "The guild you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

  it "handles permission errors by redirecting to a safe place" do
    allow(controller).to receive(:current_user)

    guild = FactoryGirl.create(:guild)
    get :show, id: guild

    expect(response).to redirect_to(root_path)
    message = "You aren't allowed to do that."
    expect(flash[:alert]).to eq message
  end
end
