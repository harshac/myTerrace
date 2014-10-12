class Terrace < ActiveRecord::Base
  belongs_to :owner
  has_many :availabilities

  accepts_nested_attributes_for :owner, :availabilities

end
