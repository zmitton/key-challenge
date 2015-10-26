class Game < ActiveRecord::Base
  has_many :users, foreign_key: :game_id
  belongs_to :creator, class_name: "User", foreign_key: :creator_id
end
