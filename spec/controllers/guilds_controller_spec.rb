require 'rails_helper'

RSpec.describe GuildsController, type: :controller do
  it "handles a missing guild corrrectly" do
    get :show, id: "not-here"

    expect(response).to redirect_to(guilds_path)

    message = "The guild you were looking for could not be found."
    expect(flash[:alert]).to eq message
  end

end
