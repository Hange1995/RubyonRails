class CreateDoctor < ActiveRecord::Migration[5.2]
  def change
    create_table :doctors do |t|
      t.string :firstName
      t.string :lastName
      t.string :email
      t.timestamps
    end
  end
end
