class Recipient < ActiveRecord::Base
  has_many :cheques, dependent: :destroy	
  belongs_to :customer
end
