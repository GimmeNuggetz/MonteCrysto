class EditUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :account_value, :float
    add_column :users, :portfolio_id, :integer
  end
end
