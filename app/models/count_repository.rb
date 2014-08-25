require 'lotus/model'

class CountRepository
  include Lotus::Repository

  def self.find_by_name(name)
    counters = query do
      where(name: name).limit(1)
    end
    raise Lotus::Model::EntityNotFound.new unless counters.exist?
    counters.first
  end

  def self.find_or_create(name)
    find_by_name name
  rescue Lotus::Model::EntityNotFound
    create(Count.new(name: name, value: 1))
  end
end
