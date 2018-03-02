module Postal
  module MessageDB
    module Migrations
      class AddReplacedLinkCountToMessages < Postal::MessageDB::Migration
        def up
          @database.query("ALTER TABLE #{@database.database_name}.messages ADD COLUMN tracked_links int DEFAULT 0")
          @database.query("ALTER TABLE #{@database.database_name}.messages ADD COLUMN tracked_images int DEFAULT 0")
          @database.query("ALTER TABLE #{@database.database_name}.messages ADD COLUMN parsed boolean DEFAULT false")
        end
      end
    end
  end
end
