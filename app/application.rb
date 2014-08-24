require 'lotus'

module OneFile
  class Application < Lotus::Application
    configure do
      root  'app'

      load_paths << 'controllers'
      load_paths << 'views'
      load_paths << 'models'

      routes do
        get '/', to: 'home#index'
        post '/increment', to: 'home#increment'
      end

      handle_exceptions true
    end

    load!
  end
end

