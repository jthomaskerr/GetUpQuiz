# Postcode Model
#
# Takes:
#   :id => unique postcode id
#   :number => postcode number
#   :suburb => suburb of postcode

class Postcode < CSV_Model
  attr_accessor :number, :suburb

  def self.load(postcodes_filename)
    super postcodes_filename, Postcode
  end

  def equal?(other)
    super and
    @number == other.number and
    @suburb == other.suburb
  end

  def to_s
    "Postcode #{@id} is #{@number}: Suburb #{@suburb}"
  end

  def [](identifier)
    case identifier
      when "number", "postcode"
        @number
      when "suburb"
        @suburb
      else
        super
      end
  end

private
  def initialize(attributes)
    super
    @number = attributes['number'].to_i
    @suburb = attributes['suburb']
  end
end