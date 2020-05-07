class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    redirect_to_home_page if params[:game][:images].blank?
    
    @game = Game.create(game_params)
    redirect_to @game
  end

  def show
    picked_images = game.images.sample([6,7,8,9,10].sample)

    @data = {}

    picked_image_count = 0

    count_down_ticks.each do |i|
      picked_image_count = 0 if picked_images[picked_image_count].nil?
      @data[i] = "#{request.base_url}" + rails_blob_path(picked_images[picked_image_count], only_path: true)
      picked_image_count += 1
    end
  end

  private

    def count_down_ticks
      (1..10).map{ |i| i }.reverse
    end

    def game
      @game ||= Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(images: [])
    end

    def redirect_to_home_page
      redirect_to root_path, notice: 'You must select atleast 1 image'
    end
end
