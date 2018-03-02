module Postal
  module MessageDB
    module Migrations
      class CreateLinks < Postal::MessageDB::Migration
        def up
          @database.provisioner.create_table(:links,
            :columns => {
              :id                           =>  'SERIAL',
              :message_id                   =>  'int DEFAULT NULL',
              :token                        =>  'varchar(255) DEFAULT NULL',
              :hash                         =>  'varchar(255) DEFAULT NULL',
              :url                          =>  'varchar(255) DEFAULT NULL',
              :timestamp                    =>  'decimal(18,6) DEFAULT NULL'
            },
            :indexes => {
              :on_message_id                =>  'message_id',
              :on_token                     =>  'token(8)',
            }
          )
        end
      end
    end
  end
end
