#各種ライブラリを読み込む
namespace :recipes do
require 'net/http'
require 'json'
require 'uri'
require 'csv'

  task recipes_csv_output: :environment do
#該当するインスタンスを生成して返す
uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?applicationId=#{Settings.rakuten.applicationid}")

#URL先にGETリクエストを送る→そのボディを文字列として返す
json = Net::HTTP.get(uri)

#取得したJSON形式の文字列をRubyオブジェクトに変換して返す
rec = JSON.parse(json)

#親カテゴリを一時保存しておく
parent_id = {}

CSV.open("db/sample.csv","w", :encoding => "utf-8") do |csv|
#CSVに項目名を追加する
csv << ["recipeId","recipeTitle","recipeUrl","foodImageUrl","mediumImageUrl","smallImageUrl","recipeMaterial","recipeIndication","recipeCost"]

rec["result"]["large"].each do |data|
  recipe_uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryRanking/20170426?applicationId=#{Settings.rakuten.applicationid}&categoryId=" + data["categoryId"].to_s)
  recipe_json = Net::HTTP.get(recipe_uri)
  recipe = JSON.parse(recipe_json)
  recipe["result"].each do |result|

    #食材を取得する
    recipeMaterial = ""
    agent = Mechanize. new
    agent.verify_mode = OpenSSL::SSL::VERIFY_NONE
    page = agent.get(result["recipeUrl"].to_s)
    elements = page.search("#structuredRecipeList")

    elements_text = []
    elements.each do |ele|
      elements_text = JSON.parse(ele.inner_text)
    end

    elements_text[1].each do |key,value|
      if key == "recipeIngredient"
        recipeMaterial = value
      end
    end





    #CSVにデータを追加する
    csv << [result["recipeId"].to_s,result["recipeTitle"].to_s,result["recipeUrl"].to_s,result["foodImageUrl"].to_s,result["mediumImageUrl"].to_s,result["smallImageUrl"].to_s,result["recipeMaterial"].to_s,result["recipeIndication"].to_s,result["recipeCost"].to_s]
  puts result["recipeId"].to_s
  puts result["recipeTitle"].to_s
  puts result["recipeUrl"].to_s
  puts result["foodImageUrl"].to_s
  puts result["mediumImageUrl"].to_s
  puts result["smallImageUrl"].to_s
  puts result["recipeMaterial"].to_s
  puts result["recipeIndication"].to_s
  puts result["recipeCost"].to_s

  end
  sleep(2)
end
end

end
end