module AuthorizationHelpers
  def assign_role!(user, role, guild)
    Role.where(user: user, guild: guild).delete_all
    Role.create!(user: user, role: role, guild: guild)
  end
end

RSpec.configure do |c|
  c.include AuthorizationHelpers
end
