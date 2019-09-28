class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :sport
      t.integer :num_of_players

      t.timestamps
    end
  end
end
