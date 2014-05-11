class CreatePets < ActiveRecord::Migration
  def change
    create_table :pets do |t|
      t.string :name
      t.decimal :age
      t.string :breed
      t.string :habits
      t.string :image_url

      t.timestamps
    end
  end
end
