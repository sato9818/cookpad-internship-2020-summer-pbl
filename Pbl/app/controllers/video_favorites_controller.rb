class VideoFavoritesController < ApplicationController
    def create
        video = Video.find(params[:video_id])
        favorite = current_user.video_favorites.new(video_id: video.id)
        favorite.save
        redirect_to video_path(video)
    end
  
    def destroy
        video = Video.find(params[:video_id])
        favorite = current_user.video_favorites.find_by(video_id: video.id)
        favorite.destroy
        redirect_to video_path(video)
    end
end
