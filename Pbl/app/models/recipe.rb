class Recipe < ApplicationRecord
    has_many :recipes_videos, dependent: :destroy
    has_many :videos, through: :recipes_videos
end
