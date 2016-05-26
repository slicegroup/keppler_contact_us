module KepplerContactUs
  class Engine < ::Rails::Engine
    isolate_namespace KepplerContactUs
    config.generators do |g|
        g.template_engine :haml
    end

    config.to_prepare do
      ApplicationController.helper(ApplicationHelper)
    end
  end
end
