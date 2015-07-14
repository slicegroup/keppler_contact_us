module KepplerContactUs
  class Engine < ::Rails::Engine
    isolate_namespace KepplerContactUs
    config.generators do |g|
        g.template_engine :haml
    end
  end
end
