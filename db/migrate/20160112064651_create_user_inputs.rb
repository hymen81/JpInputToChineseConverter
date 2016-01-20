class CreateUserInputs < ActiveRecord::Migration
  def change
    create_table :user_inputs do |t|
      t.string :input
      t.timestamps null: false
    end
  end
end
