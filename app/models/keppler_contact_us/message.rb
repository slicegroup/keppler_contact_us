#Generado por keppler
require 'elasticsearch/model'
module KepplerContactUs
  class Message < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    validates_presence_of :name, :email

    def self.searching(query)
      if query
        self.search(self.query query).records.order(id: :desc)
      else
        self.order(id: :desc)
      end
    end

    def self.query(query)
      { query: { multi_match:  { query: query, fields: [:name, :subject, :create_at, :email] , operator: :and }  }, sort: { id: "desc" }, size: self.count }
    end

    #armar indexado de elasticserch
    def as_indexed_json(options={})
      {
        id: self.id.to_s,
        name:  self.name.to_s,
        subject:  self.subject.to_s,
        email:  self.email.to_s,
        content:  self.content.to_s,
        read:  self.read.to_s,
        created_at:  self.created_at.to_s,
      }.as_json
    end

  end
  #Message.import
end
