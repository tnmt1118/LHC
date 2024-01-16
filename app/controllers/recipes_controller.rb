class RecipesController < ApplicationController
require 'net/http'
require 'json'
require 'uri'

  def display
    @rec = Recipe.all
    @favorite = Favorite.news
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
      session[:search_recipeTitle] ||= params[:search][:recipeTitle]
      if session[:search_recipeTitle].present?
        conditions += "recipeTitle like'%#{Recipe.sanitize_sql_like(session[:search_recipeTitle])}%'"
      end

      #食材
      session[:search_recipeMaterial] ||= params[:search][:recipeMaterial]
      if session[:search_recipeMaterial].present?
        unless conditions.blank?
          conditions += " and "
        end
        conditions += "recipeMaterial like'%#{Recipe.sanitize_sql_like(session[:search_recipeMaterial])}%'"
      end

      #調理時間
      session[:search_recipeIndication] ||= params[:search][:recipeIndication]
      if session[:search_recipeIndication].present?
        recipeIndication = ""
        case session[:search_recipeIndication].to_i
          when 2
            recipeIndication = "5分以内"
          when 3
            recipeIndication = "約10分"
          when 4
            recipeIndication = "約15分"
          when 5
            recipeIndication = "約30分"
          when 6
            recipeIndication = "約1時間"
          when 7
            recipeIndication = "1時間以上"
        end
        unless conditions.blank?
          conditions += " and "
        end
        conditions += "recipeIndication = '#{recipeIndication}'"
      end

      #費用
      session[:search_recipeCost] ||= params[:search][:recipeCost]
      if session[:search_recipeCost].present?
        recipeCost =""
        case session[:search_recipeCost].to_i
          when 2
            recipeCost = "100円以下"
          when 3
            recipeCost = "300円前後"
          when 4
            recipeCost = "500円前後"
          when 5
            recipeCost = "1,000円前後"
          when 6
            recipeCost = "2,000円前後"
          when 7
            recipeCost = "3,000円前後"
          when 8
            recipeCost = "5,000円前後"
          when 9
            recipeCost = "10,000円以上"
        end
        unless conditions.blank?
          conditions += " and "
        end
        conditions += "recipeCost = '#{recipeCost}'"
      end

      block = Block.where(user_id: current_user.id)
      block.each do |block_keyword|
        unless conditions.blank?
          conditions += " and "
        end
        conditions += "recipeMaterial not like '%#{Recipe.sanitize_sql_like(block_keyword.block)}%'" 
      end

      if conditions.blank?
        @rec = Recipe.all.order(created_at: :desc)
      else
        @rec = Recipe.where(conditions).order(created_at: :desc)
      end

      render :display
    else
      
      session[:search_recipeTitle] = nil
      session[:search_recipeMaterial] = nil
      session[:search_recipeIndication] = nil
      session[:search_recipeCost] = nil

      render :search
      
    end
  end
end

