class Appointment < ApplicationRecord
  validates_presence_of :date, :time

  belongs_to :doctor
  belongs_to :patient
end
