class Provision < ApplicationRecord
  belongs_to :category
  has_many :spent
  has_many :provision

  def category_description
    if category.blank?
      ''
    else
      category.name
    end
  end

end
