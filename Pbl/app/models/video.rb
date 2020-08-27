class Video < ApplicationRecord
    has_many :recipes_videos, dependent: :destroy
    has_many :recipes, through: :recipes_videos
end
