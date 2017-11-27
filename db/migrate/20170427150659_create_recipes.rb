class CreateRecipes < ActiveRecord::Migration[5.0]
  def change
    create_table :recipes do |t|
      t.string :recipeName
      t.text :description
      t.integer :chefID
      t.timestamps
    end
  end
end
