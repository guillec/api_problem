class ApiProblemGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :one, :type => :hash, :required => false, :default => {}

  def build_http_error
    template "api_problem_layout.jbuilder.erb", "app/views#{ns_path}api_problems/#{name}.jbuilder"
    template "api_problem_layout.xml.erb", "app/views#{ns_path}api_problems/#{name}.xml.erb"
  end

  def build_error_html
    template "errors_view.html.erb", "app/views#{ns_path}errors/#{name}.html.erb"
    template "errors_controller.erb", "app/controllers#{ns_path}errors_controller.rb"
  end

  def build_route
    route "match '#{ns_path}#{name}' => '#{ns_class_name}errors##{name}', :via => :get, :as => :#{problem}"
    inject_into_class "app/controllers/#{ns_path}errors_controller.rb", "#{ns_class_name}ErrorsController".classify, "def #{name}\nend\n"
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

    def ns_class_name
      ns ? "#{ns.classify}::" : ""
    end

    def problem
      ns ? "#{ns}_#{name}" : "#{name}"
    end
    
    def problem_url
      "#{problem}_url"
    end

end
