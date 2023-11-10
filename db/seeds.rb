# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'net/http'
require 'json'
require 'uri'

uri = URI.parse("https://app.rakuten.co.jp/services/api/Recipe/CategoryList/20170426?applicationId=#{Settings.rakuten.applicationid}")

json = Net::HTTP.get(uri)

rec = JSON.parse(json)

parent_id = {}

rec["result"]["large"].each do |data|
    #puts data["categoryId"]
    #puts ""
    #puts ""
    #puts data["categoryId"]
    #puts data["categoryName"]
    Category.create(category1: 'data["categoryId"]',name:'data["categoryName"]')
end

rec["result"]["medium"].each do |data|
    #puts data["parentCategoryId"]
    #puts data["categoryId"]
    #puts ""
    #puts data["parentCategoryId"].to_s + "-" + data["categoryId"].to_s
    #puts data["categoryName"]
    parent_id[data["categoryId"].to_s] = data["parentCategoryId"]
    #puts parent_id
    Category.create(category1: 'data["parentcategoryId"]',category2: 'data["categoryId"]',name:'data["categoryName"]')
end

rec["result"]["small"].each do |data|
    #puts parent_id[data["parentCategoryId"].to_s]
    #puts data["parentCategoryId"]
    #puts data["categoryId"]
    #puts parent_id[data["parentCategoryId"].to_s].to_s + "-" + data["parentCategoryId"].to_s + "-" + data["categoryId"].to_s
    #puts data["categoryName"]
    Category.create(category1: 'parent_id[data["parentCategoryId"].to_s]' , category2:'data["parentCategoryId"]', category3:'data["CategoryId"]', name:'data["categoryName"]')
end