class Customer < ActiveRecord::Base
	has_many :recipients, dependent: :destroy
end
