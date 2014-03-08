# ApiProblem for Rails
[![CodeClimate](https://codeclimate.com/github/guillec/http_problem.png)](https://codeclimate.com/github/guillec/api_problem)
[![Build Status](https://travis-ci.org/guillec/api-problem.png)](https://travis-ci.org/guillec/api_problem)
[![Coverage
Status](https://coveralls.io/repos/guillec/api-problem/badge.png)](https://coveralls.io/r/guillec/api_problem)

Installs a Rails generator to handle your http problems (http://tools.ietf.org/html/draft-nottingham-http-problem-06).
To read more about the media type (http://www.mnot.net/blog/2013/05/15/http_problem)

## Installation

Add this line to your application's Gemfile:

    gem 'api_problem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api_problem

## Usage in Rails
ApiProblem provides a Railtie that registers the proper MIME types with Rails:
- application/api-problem+json
- application/api-problem+xml

This gem also installs a generator for your project
    
    rail g api_problem bad_token_error
    
You can specify the problem detail object members

    rail g api_problem bad_token_error type:"http://example.com/probs/out-of-credit" status:403 title:"You do not have enough credit." detail:"Your current balance is 30, but that costs 50."
    
You can also namespace it with the ns key

    rail g api_problem bad_token_error ns:api
    
About the type, if you DON'T want a type you need to specify with false

    rail g api_problem bad_token_error type:false

About the type, if you dont set a type, it will default to the error name
    
    # This will create a bad_token_error type for you.
    rail g api_problem bad_token_error
    
Files that get created for you

    create app/views/api_problems/bad_token_error.jbuilder
    create app/views/api_problems/bad_token_error.xml.erb
    create app/views/errors/bad_token_error.html.erb
    create app/controllers/errors_controller.rb
    route  match '/bad_token_error' => 'errors#bad_token_error', :via => :get, :as => :bad_token_error
    
## TODO
- Tests for the genrator :) 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
