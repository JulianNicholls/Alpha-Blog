require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest
  test'get new category form and create category' do
    get new_category_path
    assert_template 'categories/new'

    assert_difference 'Category.count', 1 do
      post_via_redirect categories_path, category: { name: 'sports' }
    end

    assert_template 'categories/index'
    assert_match 'sports', response.body
  end
end
