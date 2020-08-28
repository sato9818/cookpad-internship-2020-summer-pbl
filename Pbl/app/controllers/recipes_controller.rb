class RecipesController < ApplicationController
    # before_action :require_signed_in, only: %i[new create]
    def index
        @recipes = Recipe.all
    end

    def new
        @recipe = Recipe.new
    end

    def videos
        @recipe = Recipe.find(params[:id])
        @videos = @recipe.videos
        @video = @videos.find_by(creator_id: @recipe.creator_id)
        @recipe_creator = User.find(@video.creator_id)
    end

    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.creator_id = current_user.id
        if @recipe.save
            redirect_to recipe_path(@recipe)
        else
            render "new"
        end
    end

    def show
        @recipe = Recipe.find(params[:id])
    end

    private
    def recipe_params
        params.require(:recipe).permit(:title, :description, :steps, :ingredient)
    end
end
