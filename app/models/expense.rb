class Expense < ApplicationRecord
  belongs_to :person
  has_many :spent

  def person_description
    if person.blank?
      ''
    else
      person.name
    end
  end
end
