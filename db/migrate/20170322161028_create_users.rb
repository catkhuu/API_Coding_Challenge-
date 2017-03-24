class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :username, null: false
      t.string :password_digest, null: false
      t.boolean :role, default: false
      t.string :auth_token

      t.timestamps(null: false)
    end
  end
end
