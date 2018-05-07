class Spent < ApplicationRecord
  belongs_to :person
  belongs_to :payment
  belongs_to :expense, optional: true
  belongs_to :category

  def category_description
    if category.blank?
      ''
  else
      category.name
    end
  end

  def person_description
    if person.blank?
      ''
    else
      person.name
    end
  end

  def payment_description
    if payment.blank?
      ''
    else
      payment.name
    end
  end

  def expense_description
    if expense.blank?
      ''
    else
      expense.number
    end
  end
end
