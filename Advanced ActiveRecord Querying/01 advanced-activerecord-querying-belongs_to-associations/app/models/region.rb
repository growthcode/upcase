class Region < ActiveRecord::Base
  has_many :locations

  scope :alphabetically_by_region, -> { all.order(:region) }
end
