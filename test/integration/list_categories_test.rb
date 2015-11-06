require 'test_helper'

# Integration test for the category list
class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    admin = User.create! username: 'admin', email: 'admin@example.com',
                         password: 'foobar', admin: true

    @article = Article.create! title: 'Test Article with distinctive title',
                               description: 'Text with a noticeable word',
                               user: admin

    @cat_s = Category.create name: 'sports'
    @cat_p = Category.create name: 'programming'

    @article.categories << @cat_p << @cat_s
  end

  test 'get category list, expect two above, expect article count' do
    get categories_path
    assert_template 'categories/index'

    assert_select 'a[href=?]', category_path(@cat_s), text: @cat_s.name
    assert_select 'a[href=?]', category_path(@cat_p), text: @cat_p.name

    assert_select 'ul.pagination', count: 0

    assert_match '1 article', response.body, count: 2
  end

  test 'get category list, ensure that the pagination link is present' do
    12.times do |idx|
      Category.create name: "Cat #{idx}"
    end

    get categories_path
    assert_template 'categories/index'

    assert_select 'ul.pagination', count: 2
  end

  test 'get category to show and expect article above to appear' do
    get category_path(@cat_s)

    assert_template 'categories/show'

    assert_select 'a[href=?]', article_path(@article), text: @article.title

    get category_path(@cat_p)
    assert_select 'a[href=?]', article_path(@article), text: @article.title
  end
end
