require 'test_helper'

# Integration test for the category list
class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @cat_s = Category.create name: 'sports'
    @cat_p = Category.create name: 'programming'
  end

  test 'get category list and ensure expected ones are present' do
    get categories_path
    assert_template 'categories/index'

    assert_select 'a[href=?]', category_path(@cat_s), text: @cat_s.name
    assert_select 'a[href=?]', category_path(@cat_p), text: @cat_p.name

    assert_select 'ul.pagination', count: 0
  end

  test 'get category list and ensure that the pagination link is present' do
    12.times do |idx|
      Category.create name: "Cat #{idx}"
    end

    get categories_path
    assert_template 'categories/index'

    assert_select 'ul.pagination', count: 2
  end
end
