class Doctor < ApplicationRecord
  validates_presence_of :name, :specialty
  validates :insurance, inclusion: { in: [ true, false ] }

  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
end
