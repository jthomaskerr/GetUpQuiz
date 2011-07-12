require 'CSV'

class CSV_Model
  attr_accessor :id

  def initialize(attributes)
    @id = attributes['id'].to_i
  end

  def equal?(other)
    not other.nil? and
    @id == other.id
  end

  def [](identifier)
    if identifier == "id"
      @id
    else
      nil
    end
  end

  # Returns an array of all the objects described in the csv file
  def self.load(file,object_type)
    items = Array.new
    CSV.foreach(file,
             :headers => true,
             :return_headers => false) do |row|
      item = object_type.new(row)
      raise "Illegal duplicate ID detected. (#{item.id})" if not items[item.id.to_i].blank?
      items[item.id.to_i] = item
    end
    items
  end
end