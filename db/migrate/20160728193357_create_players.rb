class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|

    	t.string :name
    	t.string :position
    	t.string :number
        t.string :api_id
    	t.integer :height
    	t.integer :weight

    	t.references :team

      t.timestamps null: false
    end
  end
end