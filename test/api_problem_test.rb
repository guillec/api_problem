require "test_helper.rb"
require "api/problem"

describe "Api::Problem module" do

  it "should return a hash" do

    fake_class = class Class
      include Api::Problem
    end

    http_problem = { problemType: "http://example.com", title: "This is a test" }
    assert_equal http_problem, fake_class.new.api_problem("http://example.com", "This is a test")
  end

end
