class Cheque < ActiveRecord::Base
  belongs_to :recipient

  validates :amount, :presence => true
  validates :recipient_id, :presence => {:message => " needs to be selected"}
  validates :amount, numericality: {only_decimal: true, greater_than_or_equal_to: 1}
end
