class GamesController < ApplicationController
  before_filter :require_login

  def create
    @game = Game.create(creator_id: current_user.id)
    User.find(current_user.id).update(game_id: @game.id)
    redirect_to game_path(@game.id)
  end

  def show
    redirect_to root_path unless current_user.game_id = params[:id]
    @game = current_user
  end

  def index
    @games = Game.includes(:users).where("games.status = 'not_started'")
  end
end
