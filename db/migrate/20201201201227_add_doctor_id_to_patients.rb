class AddDoctorIdToPatients < ActiveRecord::Migration[5.2]
  def change
    add_column: patient, :doctor_id, :int
  end
end
