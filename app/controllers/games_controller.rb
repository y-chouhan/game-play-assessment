class GamesController < ApplicationController
  def new
    @game = Game.new
  end

  def create
    redirect_to root_path, notice: 'You must select atleast 1 image' if params[:game][:images].blank?
    
    @game = Game.create(game_params)
    redirect_to @game
  end

  def show
    @game = Game.find(params[:id])
    picked_images = @game.images.sample([6,7,8,9,10].sample)
    @data = {}
    picked_image_count = 0
    (1..10).map{ |i| i }.reverse.each do |i|
      picked_image_count = 0 if picked_images[picked_image_count].nil?
      @data[i] = picked_images[picked_image_count]
      picked_image_count += 1
    end
    binding.pry
  end

  private
    def game_params
      params.require(:game).permit(images: [])
    end
end
