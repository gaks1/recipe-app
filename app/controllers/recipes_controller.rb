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
      redirect_to recipe_path(@recipe.id)
    end
  end

  def index
    @recipes = Recipe.where(user: current_user)
  end

  def show
    @recipe = Recipe.includes(:recipe_foods).find(params[:id])
    @ingredients = @recipe.recipe_foods.where(recipe: @recipe)
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

  def new_ingredient
    @recipe = Recipe.find(params[:recipe_id])
    @food = Food.new
    @recipe_food = @food.recipe_foods.build
  end

  def create_ingredient
    @current_user = current_user
    @recipe = Recipe.find(params[:recipe_id])
    @food = @current_user.foods.build(food_params.except(:recipe_foods_attributes))

    puts @food.inspect
    if @food.save
      @recipe_food = @food.recipe_foods.build(recipe: @recipe,
                                              quantity: food_params[:recipe_foods_attributes]['0'][:quantity])

      if @recipe_food.save
        redirect_to recipe_path(@recipe), notice: 'Your Recipe is created successfully 🎉'
      else
        flash[:alert] = 'Something went wrong, try again!!'
        puts @recipe_food.errors.full_messages
        render :new_ingredient
      end
    else
      flash[:alert] = 'Something went wrong, try again!!'
      puts @food.errors.full_messages
      render :new_ingredient
    end
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity, recipe_foods_attributes: [:quantity])
  end
end
