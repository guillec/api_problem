class ApiProblemGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :one,   :type => :hash, :required => false

  def build_values 
  end

  def create_api_problem_resource
    p type
    p title
    p status
  end

  private
    def type
      one["type"]
    end

    def title
      one["title"]
    end

    def status
      Integer(one["status"])
    end

    def detail
      one["detail"]
    end

    def instance
      one["instance"]
    end

end
