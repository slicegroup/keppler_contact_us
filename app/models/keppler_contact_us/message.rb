# Message Model
module KepplerContactUs
  class Message < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include KepplerContactUs::Concerns::Messageable
    acts_as_list

    # Fields for the search form in the navbar
    def self.search_field
      fields = %w[name email subject content]
      build_query(fields, :or, :cont)
    end

    # Funcion para armar el query de ransack
    def self.build_query(fields, operator, conf)
      query = fields.join("_#{operator}_")
      query << "_#{conf}"
      query.to_sym
    end
  end
end
