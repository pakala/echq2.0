class Customer < ActiveRecord::Base
	has_many :recipients, dependent: :destroy

	validates :cust_name, :presence => true
	validates :cust_name, :uniqueness => true
end
