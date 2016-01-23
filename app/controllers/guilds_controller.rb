class GuildsController < ApplicationController
  before_action :set_guild, only: [:show, :edit, :update, :destroy]
  
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
  end

  def edit
  end

  def update
    if @guild.update(guild_params)
      flash[:notice] = "Guild has been updated."
      redirect_to @guild
    else
      flash.now[:alert] = "Guild has not been updated."
      render "edit"
    end
  end

  def destroy
    @guild.destroy

    flash[:notice] = "Guild has been deleted."
    redirect_to guilds_path
  end

  private

  def set_guild
    @guild = Guild.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The guild you were looking for could not be found."
    redirect_to guilds_path
  end

  def guild_params
    params.require(:guild).permit(:game, :name, :server, :affiliation)
  end
end
