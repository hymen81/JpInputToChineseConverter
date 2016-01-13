class CreateMtests < ActiveRecord::Migration
  def change
    create_table :mtests do |t|
      t.string :chinese
      t.string :japanese

      t.timestamps null: false
    end
  end
end
