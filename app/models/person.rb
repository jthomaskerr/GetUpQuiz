# Person Model
#
# Takes:
#   :id => unique person id
#   :name => name of person
#   :postcode_id => index to postcode model for person's address
#   :email => email address of person

class Person < CSV_Model
  attr_accessor :name, :postcode_id, :email

  def equal?(other)
    super and
    @name        == other.name        and
    @postcode_id == other.postcode_id and
    @email       == other.email
  end

  def to_s
    "Person #{@id} is #{@name}: Postcode #{@postcode_id}, Email #{@email}"
  end

  def [](identifier)
    case identifier
      when "name"
        @name
      when "postcode_id"
        @postcode_id
      when "email"
        @email
      else
        super
    end
  end

  def self.load(people_filename)
    super people_filename, Person
  end

private
  def initialize(attributes)
    super
    @name = attributes['name']
    @postcode_id = attributes['postcode_id'].to_i
    @email = attributes['email']
  end
end
