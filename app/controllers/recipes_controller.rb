class RecipesController < ApplicationController
  def new
    @recipe = Recipe.new
  end

  def create
    @current_user = current_user
    @recipe = Recipe.new(recipe_params.merge(user_id: @current_user.id))

    if @recipe.save
      redirect_to recipes_path, notice: 'Your Recipe is created successfully 🎉'
    else
      flash[:alert] = 'Something went wrong, try again!!'
      redirect_to recipes_path
    end
  end

  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def toggle_public
    @recipe = Recipe.find_by_id(params[:recipe_id])
    @recipe.public = !@recipe.public

    redirect_to recipe_path(@recipe.id), notice: 'Recipe updated' if @recipe.save
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    redirect_to recipes_url
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
