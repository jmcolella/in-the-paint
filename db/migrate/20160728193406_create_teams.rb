class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|

    	t.string :name
    	t.integer :team_id

      t.timestamps null: false
    end
  end
end