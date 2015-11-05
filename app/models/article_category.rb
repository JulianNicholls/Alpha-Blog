# Many to many connection between articles and their categories.
class ArticleCategory < ActiveRecord::Base
  belongs_to :article
  belongs_to :category
end
