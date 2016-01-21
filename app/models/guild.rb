class Guild < ActiveRecord::Base
  validates :game, presence: true
  validates :name, presence: true
end
