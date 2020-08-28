class VideoCommentsController < ApplicationController
    def create
        video = Video.find(params[:video_id])
        comment = current_user.video_comments.new(video_comment_params)
        comment.video_id = video.id
        comment.save
        redirect_to video_path(video)
    end
  
    def destroy
        VideoComment.find_by(id: params[:id], video_id: params[:video_id]).destroy
        redirect_to video_path(params[:video_id])
    end

    private
    def video_comment_params
        params.require(:video_comment).permit(:comments)
    end
end
