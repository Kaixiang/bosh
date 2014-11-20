module Bosh::Monitor

  class ThinHealth
    AsyncResponse = [-1, {}, []].freeze

    def call(env)
      EM.defer {
        env['async.callback'].call [200, {'Content-Type' => 'text/plain'}, []]
      }
      AsyncResponse
    end

  end
end
