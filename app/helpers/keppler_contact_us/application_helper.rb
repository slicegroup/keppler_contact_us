module KepplerContactUs
  module ApplicationHelper
    def module_name
      controller_path.split('/').split('admin').flatten.join('/').classify.constantize
    end
  end
end
