class CreateCategolies < ActiveRecord::Migration[6.1]
  def change
    create_table :categolies do |t|
      t.string :api_category
      t.string :category1
      t.string :category2
      t.string :category3
      t.string :name

      t.timestamps
    end
  end
end
