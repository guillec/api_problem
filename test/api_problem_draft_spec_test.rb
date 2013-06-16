require 'test_helper'
require 'api/problem'

describe "API Problem Draft Specs" do

  it "should return a http problem hash" do
    response = { problemType: "http://example.com/probs/out-of-credit", title: "Your do not have enough credit."}
    http_problem = Api::Problem.build("http://example.com/probs/out-of-credit", "Your do not have enough credit.")
    assert_equal response, http_problem
  end

end

describe "Section 3.1: Required Members" do

  describe "A problem details object MUST have the following" do

    it "should have a problemType" do
      assert_raises Api::Problem::MissingProblemType do
        http_problem = Api::Problem.build(nil, "You do not have enough credit.")
      end
    end

    it "should have a title" do
      assert_raises Api::Problem::MissingTitle do
        http_problem = Api::Problem.build("http://example.com/probs/out-of-credit", nil)
      end
    end
  end

end

describe "Section 3.2: Optional Members" do

  describe "A problem details object MAY have the following members" do

    it "may have a httpStatus" do
      http_problem = Api::Problem.build("http://example.com", "You do not have enough credit.", http_status: 200 )
      assert_equal 200, http_problem["httpStatus"]
    end

    it "may have a problemInstance" do
      http_problem = Api::Problem.build("http://example.com", "You do not have enough credit.", problem_instance: "http://example.net/account/12345/msgs/abc" )
      assert_equal "http://example.net/account/12345/msgs/abc", http_problem["problemInstance"]
    end

  end

  describe "httpStatus" do

    it "should be a number" do
      http_problem = Api::Problem.build("http://example.com", "You do not have enough credit.", http_status: "200" )
      assert_equal 200, http_problem["httpStatus"]
    end

  end

end

describe "3.3:  Extension Members" do

  describe "Problem type definitions MAY extend the problem details object with additional members." do

    it "will accepst options values" do
      http_problem = Api::Problem.build("http://example.com", "You do not have enough credit.", hammer: "Time", array: [1, 2, 3] )
      assert_equal "Time", http_problem["hammer"]
      assert_equal [1,2,3], http_problem["array"]
    end

  end

end

