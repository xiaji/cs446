class CreateLineItems < ActiveRecord::Migration
  def change
    create_table :line_items do |t|
      t.integer :cat_id
      t.integer :foster_id

      t.timestamps
    end
  end
end
