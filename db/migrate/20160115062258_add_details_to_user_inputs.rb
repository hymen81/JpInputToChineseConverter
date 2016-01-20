class AddDetailsToUserInputs < ActiveRecord::Migration
  def change
    add_column :user_inputs, :price, :integer
    add_column :user_inputs, :author, :string
  end
end
