class Spent < ApplicationRecord
  belongs_to :person
  belongs_to :payment
  belongs_to :expense
end
