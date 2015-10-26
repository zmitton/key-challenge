class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :status, default: 'not_started' # not_started, in_progress, or finished
      t.integer :creator_id
    end
  end
end
