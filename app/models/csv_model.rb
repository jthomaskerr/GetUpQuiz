require 'CSV'

class CSV_Model
  attr_accessor :id

  def initialize(attributes)
    @id = attributes['id']
  end

  # Returns an array of all the objects described in the csv file
  def self.Load(file,object_type)
    result = Array.new
    CSV.foreach(file,
             :headers => true,
             :return_headers => false) do |row|
      result << object_type.new(row)
    end
    result
  end
end