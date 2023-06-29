class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]
  load_and_authorize_resource

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to user_url(@user), notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def shopping_list
    @user = current_user
    prepare_shopping_list
    remove_user_food_from_shopping_list
    calculate_total_value
  end

  private

  def prepare_shopping_list
    @shopping_list = {}
    @user.recipes.each do |recipe|
      recipe.recipe_foods.each do |recipe_food|
        food = recipe_food.food
        if @shopping_list[food.id]
          @shopping_list[food.id][:quantity] += recipe_food.quantity
        else
          @shopping_list[food.id] = {
            food:,
            quantity: recipe_food.quantity
          }
        end
      end
    end
  end

  def remove_user_food_from_shopping_list
    @user.foods.each do |food|
      next unless @shopping_list[food.id]

      @shopping_list[food.id][:quantity] -= food.quantity
      @shopping_list.delete(food.id) if @shopping_list[food.id][:quantity] <= 0
    end
  end

  def calculate_total_value
    @total_value = 0
    @shopping_list.each_value do |item|
      @total_value += item[:quantity] * item[:food].price
    end
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:name)
  end
end
