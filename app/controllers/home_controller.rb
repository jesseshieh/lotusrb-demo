module OneFile
  module Controllers
    module Home
      include OneFile::Controller

      action 'Index' do
        def call(params)
        end
      end
    end
  end
end
