require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  def setup
    @category = Category.new(name: 'sports')
  end

  test 'category should be valid' do
    assert @category.valid?
  end

  test 'name must be present' do
    @category.name = ''
    assert_not @category.valid?
  end

  test 'name should be unique case-insensitively' do
    @category.save
    @copy = Category.new(name: 'Sports')
    assert_not @copy.valid?
  end

  test 'name cannot be too short (3)' do
    @category.name = 'aa'
    assert_not @category.valid?
  end

  test 'name cannot be too long (25)' do
    @category.name = 'a' * 26
    assert_not @category.valid?
  end
end
