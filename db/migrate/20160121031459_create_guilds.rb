class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
      t.string :game
      t.string :name
      t.string :server
      t.string :affiliation

      t.timestamps null: false
    end
  end
end
