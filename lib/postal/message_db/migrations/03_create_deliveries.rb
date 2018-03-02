module Postal
  module MessageDB
    module Migrations
      class CreateDeliveries < Postal::MessageDB::Migration
        def up
          @database.provisioner.create_table(:deliveries,
            :columns => {
              :id                           =>  'SERIAL',
              :message_id                   =>  'int DEFAULT NULL',
              :status                       =>  'varchar(255) DEFAULT NULL',
              :code                         =>  'int DEFAULT NULL',
              :output                       =>  'varchar(512) DEFAULT NULL',
              :details                      =>  'varchar(512) DEFAULT NULL',
              :sent_with_ssl                =>  'boolean DEFAULT false',
              :log_id                       =>  'varchar(100) DEFAULT NULL',
              :timestamp                    =>  'decimal(18,6) DEFAULT NULL'
            },
            :indexes => {
              :on_message_id                =>  'message_id'
            }
          )
        end
      end
    end
  end
end
