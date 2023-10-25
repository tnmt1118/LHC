class CreateShoppings < ActiveRecord::Migration[6.1]
  def change

    add_column :shoppings, :memo, :text
    
    create_table :shoppings do |t|
      t.string :buy
      t.string :memo
      t.integer :user_id

      t.timestamps
    end
  end
end
