# Person Model
#
# Takes:
#   :id => unique person id
#   :name => name of person
#   :postcode_id => index to postcode model for person's address
#   :email => email address of person

require 'CSV'

class Person < CSV_Model
  PEOPLE = RAILS_ROOT + "/data/people.csv"
  attr_accessor :name, :postcode_id, :email

  def initialize(attributes)
    super
    @name = attributes['name']
    @postcode_id = attributes['postcode_id']
    @email = attributes['email']
  end

  def equal?(other)
    super and
    @name = other.name and
    @postcode_id = other.postcode_id and
    @email = other.email
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

  def self.Load
    super PEOPLE, Person
  end
end