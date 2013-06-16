require "api/problem/version"
require "api/problem/railtie" if defined?(Rails)

module Api

  module Problem
    MissingTitle       = Class.new(StandardError)
    MissingProblemType = Class.new(StandardError)

    def self.build(problem_type, title, options={})
      response ={}
      raise Api::Problem::MissingProblemType if problem_type.nil?
      raise Api::Problem::MissingTitle if title.nil?
      new_options = build_options(options)
      unless new_options.empty?
        { problemType: problem_type, title: title }.merge(new_options)
      else
        { problemType: problem_type, title: title }
      end
    end

    def api_problem(problem_type, title, options={})
      Api::Problem.build problem_type, title, options
    end

    private
    def self.build_options(options)
      new_options ={}
      options.each do |key, value|
        key = convert_key(key)
        value = convert_value(key, value)
        new_options[key] = value
      end
      new_options
    end

    def self.convert_key(key)
      if key == :http_status || key == "http_status"
        key = "httpStatus"
      elsif key == :problem_instance || key == "problem_instance"
        key = "problemInstance"
      end
      key.to_s
    end

    def self.convert_value(key, value)
      if key == "httpStatus"
        value = value.to_i
      end
      value
    end
  end

end
