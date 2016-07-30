class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|

    	t.string :name
    	t.string :position
    	t.integer :team_id
    	t.string :number
    	t.string :height
    	t.string :weight
    	t.integer :average_points
    	t.integer :average_assists
    	t.float :average_rebounds

    	t.references :team

      t.timestamps null: false
    end
  end
end