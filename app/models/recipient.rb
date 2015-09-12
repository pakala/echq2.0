class Recipient < ActiveRecord::Base
  has_many :chequs, dependent: :destroy	
  belongs_to :customer
end
