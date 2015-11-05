# Article categories, each article can have many categories
class Category < ActiveRecord::Base
  has_many :article_categories
  has_many :articles, through: :article_categories

  validates :name,
            presence: true,
            uniqueness: { case_sensitive: false },
            length: { in: 3..25 }
end
