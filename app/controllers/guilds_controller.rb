class GuildsController < ApplicationController
  
  def index
    @guild = Guild.all
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

  def edit
    @guild = Guild.find(params[:id])
  end

  def update
    @guild = Guild.find(params[:id])
    
    if @guild.update(guild_params)
      flash[:notice] = "Guild has been updated."
      redirect_to @guild
    else
      flash.now[:alert] = "Guild has not been updated."
      render "edit"
    end
  end

  def destroy
    @guild = Guild.find(params[:id])
    @guild.destroy

    flash[:notice] = "Guild has been deleted."
    redirect_to guilds_path
  end

  private

  def guild_params
    params.require(:guild).permit(:game, :name, :server, :affiliation)
  end
end
