class RemoveDetailsToUserInputs < ActiveRecord::Migration
  def change
    remove_column :user_inputs, :price, :integer
    remove_column :user_inputs, :author, :string
  end
end
