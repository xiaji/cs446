class ChangeAgeToInt < ActiveRecord::Migration
  def change
    change_column :pets, :age, :integer
  end
end
