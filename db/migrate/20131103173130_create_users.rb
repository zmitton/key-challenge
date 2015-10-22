class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :name
      t.string :username
      t.binary :public_key_string
      t.binary :private_key_string
      t.string :oauth_token
      t.datetime :oauth_expires_at

      t.timestamps
    end
  end
end
