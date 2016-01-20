class CreateMapTables < ActiveRecord::Migration
  def change
    create_table :map_tables do |t|
      t.string :chinese
      t.string :japanese

      t.timestamps null: false
    end
  end
end
