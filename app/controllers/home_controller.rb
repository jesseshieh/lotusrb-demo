require 'lotus/model'

module OneFile
  module Controllers
    module Home
      include OneFile::Controller

      action 'Index' do
        expose :count
        def call(params)
          @count = CountRepository.find_or_create(1)
        end
      end

      action 'Increment' do
        handle_exception Lotus::Model::EntityNotFound => 404
        handle_exception ArgumentError => 400

        def call(params)
          id = params[:id] or raise ArgumentError, "id is missing"
          by = params[:by] or raise ArgumentError, "by is missing"
          @count = CountRepository.find id.to_i
          @count = @count.increment by.to_i
          CountRepository.update(@count)
          redirect_to '/'
        end
      end
    end
  end
end
