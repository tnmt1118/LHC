class RecipesController < ApplicationController
  def display
    uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=#{Settings.rakuten.applicationid}")
    json = Net::HTTP.get(uri)
    @rec = JSON.parse(json)
    
  end

  def details
  end
  
  def search
  end
end
