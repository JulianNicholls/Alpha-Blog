ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/reporters'

MiniTest::Reporters.use!

module ActiveSupport
  # Base of all testcases
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in
    # alphabetical order.

    fixtures :all

    # Add more helper methods to be used by all tests here...

    def login_as(user)
      post login_path, session: { email: user.email, password: user.password }
    end
  end
end
