class RecipesController < ApplicationController
  def display
    uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?applicationId=#{Settings.rakuten.applicationid}")
    json = Net::HTTP.get(uri)
    @rec = JSON.parse(json)
    #@rec_foodImageUrl = @rec["result"][0]["foodImageUrl"]
    #@rec_recipeTitle = @rec["result"][0]["recipeTitle"]
    #@rec_recipeIndication = @rec["result"][0]["recipeIndication"]
    #@rec_recipeCost = @rec["result"][0]["recipeCost"]
    #puts rec ["result"]["small"][0]["recipeTitle"]
  end

  def details
  end
  
  def search
  end
end
