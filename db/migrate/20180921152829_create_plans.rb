class CreatePlans < ActiveRecord::Migration[5.2]
  def change
    create_table :plans do |t|
      t.decimal :price
      t.string :name
      t.string :sku

      t.timestamps
    end
  end
end
