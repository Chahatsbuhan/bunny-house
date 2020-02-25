require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test "get new category form and creat category" do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      #If using Rails 5, first add the gem 'rails-controller-testing' to your Gemfile and then run bundle install, also make note above of the line where you post to categories_path
      post categories_path, params: { category: {name: "1LDK"} }
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "1LDK", response.body
  end

  test "invalid category submission results in failure" do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      #If using Rails 5, first add the gem 'rails-controller-testing' to your Gemfile and then run bundle install, also make note above of the line where you post to categories_path
      post categories_path, params: { category: {name: " "} }
    end
    assert_template 'categories/new'
    assert_select 'h2.panel-title'
    assert_select 'div.panel-body'

  end
end
