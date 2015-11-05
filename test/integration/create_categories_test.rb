require 'test_helper'

# Integration test for the create new category process
class CreateCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @admin = User.create! username: 'admin', email: 'admin@example.com',
                          password: 'foobar', admin: true
  end

  test 'get new category form and create category' do
    login_as @admin
    get new_category_path
    assert_template 'categories/new'

    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: { name: 'sports' }
    end

    assert_template 'categories/index'
    assert_match 'sports', response.body
  end

  test 'invalid category submission results in failure' do
    login_as @admin
    get new_category_path
    assert_template 'categories/new'

    assert_no_difference 'Category.count' do
      post categories_path, category: { name: 'aa' }
    end

    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'
    assert_match 'too short', response.body
  end
end
