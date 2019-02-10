require_relative "application_record"

class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :number, presence: true
end
