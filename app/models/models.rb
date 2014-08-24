require 'lotus/model'
require 'lotus/model/adapters/sql_adapter'

mapper = Lotus::Model::Mapper.new do
  collection :counts do
    entity Count

    attribute :id,    Integer
    attribute :value, Integer
  end
end

connection_uri = "sqlite://test.db"
adapter = Lotus::Model::Adapters::SqlAdapter.new(mapper, connection_uri)
CountRepository.adapter = adapter

mapper.load!
