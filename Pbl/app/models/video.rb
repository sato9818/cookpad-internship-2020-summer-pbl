class Video < ApplicationRecord
    # has_many :recipes_videos, dependent: :destroy
    # has_many :recipes, through: :recipes_videos
    belongs_to :recipe
    has_many :video_comments, dependent: :destroy
    has_many :video_favorites, dependent: :destroy

    def favorited_by?(user)
        video_favorites.where(user_id: user.id).exists?
    end
end
