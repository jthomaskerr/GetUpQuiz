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

  def to_s
    "Person #{@id} is #{@name}: Postcode #{@postcode_id}, Email #{@email}"
  end

  def self.Load
    CSV_Model::Load PEOPLE, Person
  end
end