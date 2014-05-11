class ChangePetIdOfFosterParentsToInteger < ActiveRecord::Migration
  def change
    change_column :foster_parents, :pet_id, :integer
  end
end
