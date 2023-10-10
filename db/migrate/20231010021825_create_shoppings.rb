class CreateShoppings < ActiveRecord::Migration[6.1]
  def change
    create_table :shoppings do |t|
      t.string :buy
      t.integer :user_id

      t.timestamps
    end
  end
end
