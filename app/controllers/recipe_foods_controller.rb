class RecipeFoodsController < ApplicationController
  before_action :set_recipe_food, only: %i[show edit update destroy]

  # GET /recipe_foods or /recipe_foods.json
  def index
    @recipe_foods = RecipeFood.all
  end

  # GET /recipe_foods/1 or /recipe_foods/1.json
  def show; end

  # GET /recipe_foods/new
  def new
    @recipe_food = RecipeFood.new
  end

  # POST /recipe_foods or /recipe_foods.json
  def create
    @recipe_food = RecipeFood.new(recipe_food_params)

    respond_to do |format|
      if @recipe_food.save
        format.html { redirect_to recipe_food_url(@recipe_food), notice: 'Recipe food was successfully created.' }
        format.json { render :show, status: :created, location: @recipe_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipe_foods/1 or /recipe_foods/1.json
  def update
    @recipe_food = RecipeFood.find(params[:id])
    @recipe_food.update(recipe_food_params)
    redirect_to recipe_path(@recipe_food.recipe_id), notice: 'Ingredient was successfully updated.'
  end

  def edit
    @recipe_food = RecipeFood.find(params[:id])
    @foods = Food.where(user: current_user)
    @recipe = Recipe.find(params[:recipe_id])
  end

  # DELETE /recipe_foods/1 or /recipe_foods/1.json
  def destroy
    @recipe_food = RecipeFood.find_by_id(params[:id])
    if @recipe_food.destroy
      flash[:noticw] = 'Ingedient deleted.'
    else
      flash[:alert] = 'Ingedient deletion unsucessful.'
    end
    redirect_to recipe_path(params[:recipe_id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe_food
    @recipe_food = RecipeFood.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_food_params
    params.require(:recipe_food).permit(:quantity, :recipe_id, :food_id)
  end
end
