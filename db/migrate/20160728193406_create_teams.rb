class CreateTeams < ActiveRecord::Migration[5.0]
  def change
    create_table :teams do |t|

    	t.string :name
      t.string :market
      t.string :abbr
    	t.string :api_id
      t.string :division
      t.string :conference
      t.string :logo

      t.timestamps null: false
    end
  end
end