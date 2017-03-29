require 'pry-rails'
class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  scope :in_region, -> (region) { joins(:location).merge(Location.in_region(region)) }

  # def self.in_region(region)
  #   joins(:location).merge(Location.in_region(region))
  # end

  # creates a scope of getting just people where there is a location and that location has a region
  def self.with_regions
    joins(location: :region)
  end

  # orders in precedence of the oder given per comma
  def self.alphabetically_by_region_and_location
    with_regions.order("regions.name, locations.name, name")
  end
end



# alt answer for alphabetically_by_region_and_location
# def self.in_region(region)
#   joins(:region).merge(Region.by_name(region))
# end

# def self.ordered_by_region
#   joins(:region).order('regions.name ASC, locations.name ASC, people.name ASC')
# end
