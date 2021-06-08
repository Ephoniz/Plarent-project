class CreatePlanets < ActiveRecord::Migration[6.1]
  def change
    create_table :planets do |t|
      t.string :name
      t.integer :radius
      t.string :atmosphere
      t.float :temperature
      t.text :description
      t.string :galaxy
      t.float :price
      t.boolean :available, default: true
      t.references :owner

      t.timestamps
    end
  end
end
