require 'test_helper'

class CategoriesControllerTest < ActionController::TestCase
  def setup
    @admin = User.create! username: 'admin', email: 'admin@example.com', password: 'foobar', admin: true

    @category = Category.create name: 'sports'
  end

  test 'should get categories index' do
    get :index
    assert_response :success
  end

  test 'should get new category' do
    session[:user_id] = @admin.id # Admin login
    get :new
    assert_response :success
  end

  test 'should get show category' do
    get :show, { id: @category.id }
    assert_response :success
  end

  test 'should redirect create when admin not logged in' do
    assert_no_difference 'Category.count' do
      post :create, category: { name: 'rugby' }
    end

    assert_redirected_to categories_path
  end
end
