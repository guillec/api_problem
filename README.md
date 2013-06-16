# Api Problem for Rails
[![CodeClimate](https://codeclimate.com/github/guillec/http_problem.png)](https://codeclimate.com/github/guillec/api_problem)
[![Build Status](https://travis-ci.org/guillec/api-problem.png)](https://travis-ci.org/guillec/api-problem)
[![Coverage
Status](https://coveralls.io/repos/guillec/api-problem/badge.png)](https://coveralls.io/r/guillec/api-problem)

With this gem you can return api errors that follow the api-problem draft specs 
- http://tools.ietf.org/html/draft-nottingham-http-problem-04

Here is @mnot explanation behind the draft:
- http://www.mnot.net/blog/2013/05/15/http_problem

## Installation

Add this line to your application's Gemfile:

    gem 'api-problem'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install api-problem

## Basics on Gem

This gem installs the following method: 

    api_problem( problem_type, title, { optional stuff } )

The method params:

    problem_type = required
    title = required
    args = optional values

## Usage in Rails
Api::Problem provides a Railtie that registers the proper MIME types with Rails:
- application/api-problem+json
- application/api-problem+xml


To use create your api problems controller:

    rails g controller api_problems first_error_name second_error_name

The urls to these views is what you will pass to the api_problem method as the problem_type.

Here is an example of how to return a api_error:    

    format.api_problem_json do 
      render json: api_problem first_errors_name_url, "You are out of credits",  { } 
    end

This will respond to the client with something like:

    {
      "problemType": "http://example.com/problem_details/first_error_name",
      "title": "You are out of credits",
      ...
    }

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
