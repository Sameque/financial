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

  def paid_description
    if paid
      'Pago'
    else
      'Não Pago'
    end
  end

  def sum_spent
    spent.sum(:value)
  end
end
