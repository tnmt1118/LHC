class CreateBlocks < ActiveRecord::Migration[6.1]
  def change
    create_table :blocks do |t|
      t.string :block
      t.integer :user_id

      t.timestamps
    end
  end
end
