class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people

  scope :in_region, -> (region) { joins(:region).where(regions: {name: region}) }

  # def self.in_region(region)
  #   joins(:region).where(regions: {name: region})
  # end

  scope :alphabetically_by_region_and_location, -> { order(:name).joins(:region).merge(Region.alphabetically_by_region) }
end
