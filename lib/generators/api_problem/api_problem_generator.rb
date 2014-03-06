class ApiProblemGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  argument :one,   :type => :hash, :required => false, :default => {}

  def building
    p type
    p title
    p status
    p detail
    p instance
  end

  private
    def type
      one["type"]
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

end
