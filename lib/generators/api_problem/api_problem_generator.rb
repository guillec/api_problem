class ApiProblemGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :one, :type => :hash, :required => false, :default => {}

  def building
    p type
    p title
    p status
    p detail
    p instance
    p ns
    template "api_problem_layout.jbuilder.erb", "app/views#{ns_path}api_problem/#{name}.jbuilder"
  end

  private
    # User must specify that they don't a type by setting type:false
    def type
      if one["type"].nil?
        problem_url
      elsif one["type"] && one["type"] != "false"
        "'#{one["type"]}'"
      elsif one["type"] && one["type"] == "false"
        nil
      end
    end

    def title
      one["title"]
    end

    def status
      one["status"] ? Integer(one["status"]) : nil
    end

    def detail
      one["detail"]
    end

    def instance
      one["instance"]
    end
    
    # Namespace
    def ns
      one["ns"]
    end

    def ns_path
      ns ? "/#{ns}/" : "/"
    end
    
    def problem_url
      "#{name}_url"
    end

end
