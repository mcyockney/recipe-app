class RecipesController < ApplicationController
    before_action :get_recipe, only: [:edit, :update, :show, :like]
    before_action :require_user, except: [:show, :index]
    before_action :require_same_user, only: [:edit, :update]
    
    def index
        @recipes = Recipe.paginate(page: params[:page], per_page: 5)
    end
    
    def show
    end
    
    def new
        
        @recipe = Recipe.new
    end
    
    def create
        @recipe = Recipe.new(recipe_params)
        @recipe.chef_id=current_user.id
        logger.debug "Chef id: #{current_user.attributes.inspect}"
        logger.debug "Recipe: #{@recipe.attributes.inspect}"
        if @recipe.save
           flash[:success] = "Your recipe was created succewssfully"
           redirect_to recipes_path
        else
           render :new
        end
    end
    
    def edit
    end
    
    def update
        if @recipe.update(recipe_params)
            flash[:success] = "Your recipe was updated successfully"
            redirect_to recipe_path(@recipe)
        else
            render :edit
        end
    end
    
    def like
        like = Like.create(like: params[:like], chef: current_user, recipe: @recipe)
        if like.valid?
            flash[:success] = "Your selection was recorded"
            redirect_to :back
        else
           flash[:danger] = "You can only vote once" 
           redirect_to :back
        end
    end
    
    private 
        def recipe_params
            params.require(:recipe).permit(:name, :summary, :description, :picture)
        end

        def require_same_user
            if current_user != @recipe.chef
                flash[:danger] = "You can only edit your own recipes"
                redirect_to recipes_path
            end
        end
        
        def get_recipe
            @recipe = Recipe.find(params[:id])
        end
        
end