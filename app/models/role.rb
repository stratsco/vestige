class Role < ActiveRecord::Base
  belongs_to :user
  belongs_to :guild

  def self.available_roles
    %w(guild_master officer member)
  end
end
