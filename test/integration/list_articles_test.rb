require 'test_helper'

# Integration test for the category list
class ListAndShowArticleTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create! username: 'admin', email: 'admin@example.com',
                          password: 'foobar', admin: true
    @article = Article.create! title: 'Test Article',
                               description: 'Description of Text', user: @admin

    @cat_s = Category.create! name: 'Sports'
    @cat_p = Category.create! name: 'Programming'

    @article.categories << @cat_p << @cat_s
  end

  test 'list articles and ensure that it has both categories' do
    get articles_path

    assert_template 'articles/index'

    assert_select 'span.badge', count: 2
    assert_select 'a[href=?]', category_path(@cat_s), text: @cat_s.name
    assert_select 'a[href=?]', category_path(@cat_p), text: @cat_p.name
  end

  test 'get article to show and ensure that it has both categories' do
    get article_path(@article.id)

    assert_template 'articles/show'

    assert_select 'span.badge', count: 2
    assert_select 'a[href=?]', category_path(@cat_s), text: @cat_s.name
    assert_select 'a[href=?]', category_path(@cat_p), text: @cat_p.name
  end

  test 'show the user page and ensure that its article has both categories' do
    get user_path(@admin)

    assert_template 'users/show'

    assert_select 'span.badge', count: 2
    assert_select 'a[href=?]', category_path(@cat_s), text: @cat_s.name
    assert_select 'a[href=?]', category_path(@cat_p), text: @cat_p.name
  end
end
