class CreateClothings < ActiveRecord::Migration[7.0]
  def change
    create_table :clothings do |t|
      t.string :label
      t.float :price
      t.string :path
      t.integer :quant
      t.string :description

      t.timestamps
    end
  end
end
