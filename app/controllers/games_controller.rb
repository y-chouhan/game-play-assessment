# frozen_string_literal: true

class GamesController < ApplicationController
  def create
    redirect_to_home_page if params[:game][:images].blank?
    @game = Game.create(game_params)
    redirect_to @game
  end

  def new
    @game = Game.new
  end

  def show
    @data = {}
    @picked_image_count = 0
    count_down_ticks.each { |i| arrange_data(i) }
  end

  private

  def arrange_data(tick)
    @picked_image_count = 0 if picked_images[@picked_image_count].nil?
    @data[tick] = request.base_url.to_s + image_blob
    @picked_image_count += 1
  end

  def count_down_ticks
    (1..10).map { |i| i }.reverse
  end

  def game
    @game ||= Game.find(params[:id])
  end

  def game_params
    params.require(:game).permit(images: [])
  end

  def image_blob
    rails_blob_path(picked_images[@picked_image_count], only_path: true)
  end

  def picked_images
    @picked_images ||= game.images.sample([6, 7, 8, 9, 10].sample)
  end

  def redirect_to_home_page
    redirect_to root_path, notice: 'You must select atleast 1 image'
  end
end
