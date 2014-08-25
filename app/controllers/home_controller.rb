require 'lotus/model'

module OneFile
  module Controllers
    module Home
      include OneFile::Controller

      action 'Index' do
        expose :count
        def call(params)
          @count = CountRepository.find_or_create(params[:name])
        end
      end

      action 'Increment' do
        handle_exception Lotus::Model::EntityNotFound => 404
        handle_exception ArgumentError => 400

        def call(params)
          name = params[:name] or raise ArgumentError, "name is missing"
          by = params[:by] or raise ArgumentError, "by is missing"
          count = CountRepository.find_by_name name
          count = count.increment by.to_i
          CountRepository.update(count)
          redirect_to '/' + count.name
        end
      end
    end
  end
end
