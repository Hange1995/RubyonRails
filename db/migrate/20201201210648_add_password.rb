class AddPassword < ActiveRecord::Migration[5.2]
  def change
    add_column :doctors, :password_digest, :string
  end
end
