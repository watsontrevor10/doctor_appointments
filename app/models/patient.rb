class Patient < ApplicationRecord
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments

  def patient_full_name
    "#{self.first_name} #{self.last_name}"
  end
end
