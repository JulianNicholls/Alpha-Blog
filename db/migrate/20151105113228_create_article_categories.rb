class CreateArticleCategories < ActiveRecord::Migration
  def change
    create_table :article_categories do |t|
      t.references :article, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true
    end
  end
end
