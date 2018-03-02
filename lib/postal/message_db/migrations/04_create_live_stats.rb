module Postal
  module MessageDB
    module Migrations
      class CreateLiveStats < Postal::MessageDB::Migration
        def up
          @database.provisioner.create_table(:live_stats,
            :columns => {
              :type                         =>  'varchar(20) NOT NULL',
              :minute                       =>  'int NOT NULL',
              :count                        =>  'int DEFAULT NULL',
              :timestamp                    =>  'decimal(18,6) DEFAULT NULL',
            },
            :primary_key => 'minute'
          )
        end
      end
    end
  end
end
