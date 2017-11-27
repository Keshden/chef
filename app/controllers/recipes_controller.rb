class RecipesController < ApplicationController
  before_action :set_recipe, only: [:edit, :update, :show, :destroy]

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:success] = "Recipe successfully created"
      redirect_to recipe_path(@recipe)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @recipe.update(recipe_params)
      flash[:success] = "Recipe was successfully updated"
      redirect_to recipe_path(@recipe)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @recipe.destroy
    flash[:danger] = "Recipe was successfully deleted"
    redirect_to recipes_path
  end

  private

  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(:recipeName, :description, :chefID)
  end

end
