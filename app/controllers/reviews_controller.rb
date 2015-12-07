class ReviewsController < ApplicationController
    before_action :require_user, except: [:show]
    
    def new
        @review = Review.new
    end
    
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @review = @recipe.reviews.create(review_params)
        @review.chef_id = current_user
        if @review.save
           flash[:success] = "Your review was created successfully"
           redirect_to recipe_path(@review.recipe)
        else
           render :new
        end        
    end
    
    private

        def review_params
            params.require(:review).permit(:review_entry, :recipe_id)
        end

   
    
end