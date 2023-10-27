class AddColumnMemo < ActiveRecord::Migration[6.1]
  def change
    add_column :shoppings, :memo, :text
  end
end
