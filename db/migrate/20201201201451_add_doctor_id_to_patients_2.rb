class AddDoctorIdToPatients2 < ActiveRecord::Migration[5.2]
  def change
        add_column :patients, :doctor_id, :int

  end
end
