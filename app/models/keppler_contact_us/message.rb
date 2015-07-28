#Generado por keppler
require 'elasticsearch/model'
module KepplerContactUs
  class Message < ActiveRecord::Base
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks
    validates_presence_of :name, :email
    
    after_commit on: [:update] do
      __elasticsearch__.index_document
    end

    def self.searching(query)
      if query
        self.search(self.query query).records.order(id: :desc)
      else
        self.order(id: :desc)
      end
    end

    def self.query(query)
      { query: { multi_match:  { query: query, fields: [:name, :subject, :create_at, :email, :read] , operator: :and }  }, sort: { id: "desc" }, size: self.count }
    end

    #armar indexado de elasticserch
    def as_indexed_json(options={})
      {
        id: self.id.to_s,
        name:  self.name,
        subject:  self.subject,
        email:  self.email,
        content:  self.content,
        read:  self.read ? "si--leidos" : "no--leidos",
        created_at:  self.created_at.to_s,
      }.as_json
    end

  end
  #Message.import
end
