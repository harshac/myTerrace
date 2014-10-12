class Terrace < ActiveRecord::Base
  belongs_to :owner
  has_many :availabilities
end
