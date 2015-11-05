require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest
  def setup
    @category1 = Category.create name: 'sports'
    @category2 = Category.create name: 'programming'
  end

  test 'get category list and ensure expected ones are present' do
    get categories_path
    assert_template 'categories/index'

    assert_select 'a[href=?]', category_path(@category1), text: @category1.name
    assert_select 'a[href=?]', category_path(@category2), text: @category2.name

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
