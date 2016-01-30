class Guild < ActiveRecord::Base
  validates :game, presence: true
  validates :name, presence: true

  has_many :roles, dependent: :delete_all
end
