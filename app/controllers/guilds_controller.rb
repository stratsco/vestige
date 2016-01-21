class GuildsController < ApplicationController
  
  def index
  end

  def new
    @guild = Guild.new
  end

  def create
    @guild = Guild.new(guild_params)

    if @guild.save
      flash[:notice] = "Guild has been created."
      redirect_to @guild
    else
      flash.now[:alert] = "Guild has not been created."
      render "new"
    end
  end

  def show
    @guild = Guild.find(params[:id])
  end

  private

  def guild_params
    params.require(:guild).permit(:game, :name, :server, :affiliation)
  end
end
