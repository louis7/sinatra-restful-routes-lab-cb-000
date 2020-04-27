require 'spec_helper'

describe "Recipe App" do
  let(:recipe_name) { "Bomb.com Mac and Cheese" }
  let(:recipe_ingredients) { "milk, butter, cheese, elbow pasta" }
  let(:recipe_cook_time) { "20 minutes" }

  before do
    @recipe1 = Recipe.create(:name => recipe_name, :ingredients => recipe_ingredients, :cook_time => recipe_cook_time)
    @recipe2 = Recipe.create(:name => "waldorf salad", :ingredients => "apples, cabbage, oil, vinegar", :cook_time => "0")
  end

  describe "Index page '/recipes'" do

    before do
      visit "/recipes"
    end

    it 'responds with a 200 status code' do
    end

    it "displays a list of recipes" do
      
    end

    it "contains links to each recipe's show page" do
      all_link_hrefs = page.all(:css, "a[href]").map do |element| 
        element[:href] 
      end
      
    end

  end

    
  describe "show page '/recipes/:id'" do
    before do
    end

    it 'responds with a 200 status code' do
    end

    it "displays the recipe's name" do
    end

    it "displays the recipe's ingredients" do
    end

    it "displays the recipe's cook time" do
    end

    it "contains a form to delete the recipe" do
    end

    it 'deletes via a DELETE request' do
    end
  end

  describe "edit page '/recipes/:id/edit'" do
    before do
      visit "/recipes/#{@recipe1.id}/edit"
    end

    it 'responds with a 200 status code' do
    end

    it "contains a form to edit the recipe" do
    end

    it "displays the recipe's ingredients before editing" do
    end

    it "submits via a patch request" do
    end

  end

  describe "new page '/recipes/new'" do
    before do
      visit "/recipes/new"
    end

    it 'responds with a 200 status code' do
    end

    it "contains a form to create the recipe" do
    end

    it "posts the form back to create a new recipe" do

      fill_in :name, :with => "Enchiladas con Salsa Verde"
      fill_in :ingredients, :with => "Tortillas, Queso Blanco, Tomatillos, Onion, Garlic, Black beans, Cilantro"
      fill_in :cook_time, :with => "20 minutes"

      page.find(:css, "[type=submit]").click

      
    end
  end

  describe "creating a new recipe" do 
    before do 
      params = {
        "name" => "pumpkin pie",
        "ingredients" => "pumpkin, flour, butter, sugar",
        "cook_time" => "1 hour"
      }
      post '/recipes', params
      follow_redirect!
    end

    it "creates a new recipe and saves to the database" do
    
    end

    it "redirects to the recipe show page" do 
      expect(last_request.url).to include("/recipes/#{Recipe.last.id}")
    end
  end

  describe "updating a recipe" do
    before do
      @cookie = Recipe.create(
        name:   "Chocolate Chip Cookies", 
        ingredients:  "chocolate chips, flour, sugar, butter", 
        cook_time:  "30 minutes", 
      )

      visit "/recipes/#{@cookie.id}/edit"

      fill_in :name, :with => "Double chocolate chip cookies"
      fill_in :ingredients, :with => "chocolate chips, flour, sugar, butter, cocoa powder"
      fill_in :cook_time, :with => "30 minutes"

      page.find(:css, "[type=submit]").click
    end

    it "updates the recipe" do
      
    end

    it "redirects to the recipe show page" do
    end

  end

  describe "deleting a recipe" do

    before do
      @cookie = Recipe.create(
        name:   "Chocolate Chip Cookies", 
        ingredients:  "chocolate chips, flour, sugar, butter", 
        cook_time:  "30 minutes", 
      )
      visit  "/recipes/#{@cookie.id}"

      click_button "delete"
    end

    it "deletes a recipe" do
    end

  end
  
end
