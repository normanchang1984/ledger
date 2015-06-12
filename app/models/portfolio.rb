class Portfolio < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :orgprice
  validates_presence_of :shares
end
