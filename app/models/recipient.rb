class Recipient < ActiveRecord::Base
  has_many :cheques, dependent: :destroy	
  belongs_to :customer

  validates :recipient_name, :presence => true
  validates :customer_id, :presence => {:message => " needs to be selected"}
  validates :recipient_name, :uniqueness => true
end
