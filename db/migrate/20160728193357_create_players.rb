class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|

    	t.string :name, null: false
    	t.string :position, null: false
    	t.integer :number, null: false
    	t.integer :height, null: false
    	t.integer :weight, null: false
    	t.integer :average_points, null: false
    	t.integer :average_assists, null: false
    	t.integer :average_rebounds, null: false

    	t.references :team, null: false

      t.timestamps null: false
    end
  end
end