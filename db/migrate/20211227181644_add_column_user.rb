class AddColumnUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :name, :string
    add_column :users, :email, :string
    add_column :users, :address, :text
    add_column :users, :password_digest, :string
  end
end
