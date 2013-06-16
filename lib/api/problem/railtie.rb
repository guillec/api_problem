require 'rails'

module Api
  module Problem
    class Railtie < ::Rails::Railtie
      config.to_prepare do
        ApplicationController.send(:include, Api::Problem)
      end
      initializer 'api-problem-json' do
        Mime::Type.register 'application/api-problem+json', :api_problem_json
      end
      initializer 'api-problem-xml' do
        Mime::Type.register 'application/api-problem+xml', :api_problem_xml
      end
    end
  end
end
