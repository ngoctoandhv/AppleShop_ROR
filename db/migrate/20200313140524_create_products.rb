class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :model
      t.text :description
      t.string :title
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.string :image
      t.string :color
      t.string :condition

      t.timestamps
    end
  end
end
