class Cheque < ActiveRecord::Base
  belongs_to :recipient
end
