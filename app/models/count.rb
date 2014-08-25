require 'lotus/model'

class Count
  include Lotus::Entity
  self.attributes = :name, :value

  def increment by
    Count.new(id: id, name: name, value: value + by)
  end
end
