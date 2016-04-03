class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    3.times{ @recipe.steps.build }
    @recipe.steps.each do |s|
      s.ingredients.build
    end
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def search
    query = params[:q]
    tags = params[:tag][:ids]

    # SELECT DISTINCT recipes.name
    #   FROM recipes
    #   INNER JOIN steps ON steps.recipe_id=recipes.id
    #   INNER JOIN ingredients ON ingredients.step_id=steps.id
    #   INNER JOIN recipe_tags ON recipe_tags.recipe_id=recipes.id
    #   INNER JOIN tags ON tags.id=recipe_tags.tag_id
    #   WHERE (tags.name="Entrees"  OR tags.name="Desserts") AND ingredients.name="cinnamon";

    @results = Recipe.joins(:tags, :ingredients).where(ingredients: {name: query}, tags: {id: tags}).uniq
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, tag_ids: [], steps_attributes: [:id, :description, :_destroy, ingredients_attributes: [:id, :amount, :unit, :name, :_destroy]] )
    end
end
