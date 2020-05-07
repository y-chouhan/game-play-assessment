# frozen_string_literal: true

class Game < ApplicationRecord
  has_many_attached :images
  has_many :plays
end
