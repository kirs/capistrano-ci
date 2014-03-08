module Capistrano
  module CI
    class Client
      class NotFound < StandardError; end

      class << self
        def register(client_name, client_class, attributes = [])
          self.clients[client_name] ||= { client_class: client_class, attributes: attributes }
          @settings = settings | attributes
        end

        def clients
          @clients ||= {}
        end

        def settings
          @settings ||= [:ci_client]
        end
      end

      def state(branch)
        client.state(branch)
      end

      def passed?(branch)
        client.passed?(branch)
      end

      private

      def client
        @client ||= find_and_initialize_client or raise(NotFound, "can't find CI client with name '#{fetch(:ci_client)}'")
      end

      def find_and_initialize_client
        client_settings = self.class.clients[fetch(:ci_client)]

        client_settings[:client_class].new(prepare_client_attributes(client_settings)) if client_settings
      end

      def prepare_client_attributes(settings)
        result = {}
        settings[:attributes].map do |key|
          result[key] = fetch(key)
        end
        result
      end

    end
  end
end
