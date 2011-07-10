class PersonController < ApplicationController
  def index
    @people = Person.Load
  end

end
