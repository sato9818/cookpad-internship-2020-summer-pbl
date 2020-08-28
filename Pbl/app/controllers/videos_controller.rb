class VideosController < ApplicationController
    # before_action :require_signed_in, only: %i[new edit create update destroy]
    def index
        @videos = Video.all
    end

    def show
        @video = Video.find(params[:id])
        @video_id = @video.url.gsub(/https:\/\/www.youtube.com\/watch\?v=(\w+)/){"#{$1}"}.first(11)
        @recipe = Recipe.find(@video.recipe_id)
        @video_comment = VideoComment.new
        @videos = @recipe.videos.where.not(id: @video.id)
    end

    def new
        @video = Video.new
        # binding.irb
        if params[:recipe_id].present?
            @video.recipe_id = params[:recipe_id]
        end
    end

    def create
        @video = Video.new(video_params)
        @video.creator_id = current_user.id
        if @video.save
            redirect_to video_path(@video)
        else
            render "new"
        end
    end

    def edit
        @video = Video.find(params[:id])
    end

    def update
        @video = Video.find(params[:id])
        if @video.update(video_params)
            redirect_to video_path(@video)
        else
            render "edit"
        end
    end

    def destroy
        @video = Video.find(params[:id])
        @video.destroy
        redirect_to videos_path
    end

    private 
    def video_params
        params.require(:video).permit(:title, :description, :recipe_id, :url)
    end
end
