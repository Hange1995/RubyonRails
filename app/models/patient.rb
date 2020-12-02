class Patient < ApplicationRecord
    belongs_to :doctor
    validates :firstName,presence: true
    validates :lastName,presence: true
    validates :description, length:{ minimum:5}

end
