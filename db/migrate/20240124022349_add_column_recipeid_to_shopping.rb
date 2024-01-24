class AddColumnRecipeidToShopping < ActiveRecord::Migration[6.1]
  def change
    add_column :shoppings, :recipe_id, :integer
  end
end
