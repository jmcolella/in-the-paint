class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string   :username, { limit: 64, null: false }
      t.string 	 :email, { limit: 64, null: false }
      t.string 	 :password_digest, null: false	

      t.timestamps(null: false)
    end
  end
end
