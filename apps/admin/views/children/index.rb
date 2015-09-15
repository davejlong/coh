module Admin::Views::Children
  class Index
    include Admin::View

    def has_error?
      begin
        error and true
      rescue NoMethodError
        false
      end
    end

    def error_message
      case error
        when "404" then "Child could not be found."
      end
    end
  end
end
