# desc "Explaining what the task does"
# task :keppler_contact_us do
#   # Task goes here
# end
require File.expand_path('../../keppler_contact_us/tasks/install', __FILE__)

namespace :contact_us do
	desc "Copiar inicializador para la configuración"
	task :copy_initializer do
		KepplerContactUs::Tasks::Install.copy_initializer_file
	end

  desc "Copiar vistas al proyecto"
  task :copy_views do
    KepplerContactUs::Tasks::Install.copy_view_files
  end
end