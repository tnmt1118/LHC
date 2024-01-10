class RecipesController < ApplicationController
require 'net/http'
require 'json'
require 'uri'

  def display
    @rec = Recipe.all
    #uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?applicationId=#{Settings.rakuten.applicationid}")
    #json = Net::HTTP.get(uri)
    #@rec = JSON.parse(json)
    #@rec_foodImageUrl = @rec["result"][0]["foodImageUrl"]
    #@rec_recipeTitle = @rec["result"][0]["recipeTitle"]
    #@rec_recipeIndication = @rec["result"][0]["recipeIndication"]
    #@rec_recipeCost = @rec["result"][0]["recipeCost"]
    #puts rec ["result"]["small"][0]["recipeTitle"]
    @favorite = Favorite.new
  end

  def details
    @det = params[:id]
    @det = Recipe.find(params[:id])
    agent = Mechanize.new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    page = agent.get(@det.recipeUrl)
    elements = page.search("#structuredRecipeList")
    elements_text = []
    elements.each do |ele|
    elements_text = JSON.parse(ele.inner_text)
    end

    elements_text[1].each do |key, value|
      if key == "recipeIngredient"
        @elements_recipeIngredient = value
      end
    end

    elements_text[1].each do |key, value|
      if key == "recipeYield"
        @elements_recipeYield = value
      end
    end

  end
  
  def search
    @favorite = Favorite.new
    if params[:search].present?
       conditions = ""

      #料理名
      if params[:search][:recipeTitle].present?
        conditions += "recipeTitle like'%#{params[:search][:recipeTitle]}%'"
      end

      #食材
      if params[:search][:recipeMaterial].present?
        unless conditions.blank?
        @rec = Recipe.where("recipeMaterial like'%#{params[:search][:recipeMaterial]}%'").order(created_at: :desc)
      end

      #調理時間
      if params[:search][:recipeIndication].present?
        @rec = Recipe.where("recipeIndication like'%#{params[:search][:recipeIndication]}%'").order(created_at: :desc)
      else
        @rec = Recipe.all.order(created_at: :asc)
      end

      #費用
      if params[:search][:recipeCost].present?
        @rec = Recipe.where("recipeCost like'%#{params[:search][:recipeCost]}%'").order(created_at: :desc)
      else
        @rec = Recipe.all.order(created_at: :asc)
      end

      #入れたくない食材
      if params[:search][:ExceptMaterial].present?
        @rec = Recipe.where("ExceptMaterial like'%#{params[:search][:ExceptMaterial]}%'").order(created_at: :desc)
      else
        @rec = Recipe.all.order(created_at: :asc)
      end

      render :display
    else
      render :search
    end
  end
end
