class GuildPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user.try(:admin?) || record.roles.exists?(user_id: user)
  end

  def update?
    user.try(:admin?) || record.roles.exists?(user_id: user , role: 'guild_master')
  end
end
