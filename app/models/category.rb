class Category < ApplicationRecord
  has_many :provision
  has_many :spent
end
