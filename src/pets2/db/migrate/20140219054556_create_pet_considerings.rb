class CreatePetConsiderings < ActiveRecord::Migration
  def change
    create_table :pet_considerings do |t|
      t.references :pet, index: true
      t.belongs_to :considering, index: true

      t.timestamps
    end
  end
end
