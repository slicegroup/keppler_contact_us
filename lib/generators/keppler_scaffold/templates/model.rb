#Generado por keppler
<% module_namespacing do -%>
class <%= class_name %> < ActiveRecord::Base
  include CloneRecord

  # Fields for the search form in the navbar
  def self.search_field
    <%= ":#{attributes_names.map { |name| name }.join('_or_')}_cont" %>
  end

end
#<%= class_name %>.import
<% end -%>