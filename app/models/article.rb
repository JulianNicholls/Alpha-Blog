class Article < ActiveRecord::Base

  validates :title, length: { in: 3..50 }
  validates :description, length: { in: 10..500 }

end
