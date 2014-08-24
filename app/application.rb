require 'lotus'

module OneFile
  class Application < Lotus::Application
    configure do
      root  'app'

      load_paths << 'controllers'
      load_paths << 'views'

      routes do
        get '/', to: 'home#index'
      end
    end

    load!
  end
end
