class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :username
      t.string :base64_public_key
      t.string :base64_private_key
      t.string :oauth_token
      t.integer :game_id
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
