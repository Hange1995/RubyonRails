class CreatePatients < ActiveRecord::Migration[5.2]
  def change
    create_table :patients do |t|
      t.string :firstName
      t.string :lastName
      t.text :description
      t.timestamps
    end
  end
end
