class CreateRecipes < ActiveRecord::Migration[6.1]
  def change
    create_table :recipes do |t|
      t.integer :recipeId
      t.string :recipeTitle
      t.string :recipeUrl
      t.string :foodImageUrl
      t.string :mediumImageUrl
      t.string :smallImageUrl
      t.string :recipeMaterial
      t.string :recipeIndication
      t.string :recipeCost

      t.timestamps
    end
  end
end
