module Postal
  module MessageDB
    module PostgreSQL
      # This exists here because it needs to be required when the application loads
      # so that it isn't unloaded in development. If it was unloaded in development,
      # it would be undesirable as we'd just end up with lots of connections.

      def self.new_client
        PG.connect(
          :host => Postal.config.message_db.host,
          :user => Postal.config.message_db.username,
          :password => Postal.config.message_db.password,
          :port => Postal.config.message_db.port,
          :reconnect => true
        )
      end

      @free_clients = []

      def self.client(&block)
        client = @free_clients.shift || self.new_client
        return_value = nil
        tries = 2

        begin
          return_value = block.call(client)
        rescue PG::Error => e
          if e.message =~ /(lost connection|gone away)/i && (tries -= 1) > 0
            retry
          else
            raise
          end
        ensure
          @free_clients << client
        end

        return_value
      end
    end
  end
end
