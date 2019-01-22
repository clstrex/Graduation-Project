class PhoneNumber < ActiveRecord::Base
  belongs_to :contact
  validates :phone_numbers, presence: true, uniqueness: {case_insensitive: true}
end
