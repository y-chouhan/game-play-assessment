class PlaysController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    Play.create(play_params)
  end

  private

  def play_params
    params.permit(:tick, :img, :game_id)
  end
end
