#!/usr/bin/env ruby
require_relative '../lib/postal/config'
require 'pg'

client = PG.connect(:host => Postal.config.main_db.host, :user => Postal.config.main_db.username, :password => Postal.config.main_db.password, :port => Postal.config.main_db.port, :dbname => Postal.config.main_db.database)
result = client.exec("SELECT COUNT(id) as size FROM `queued_messages` WHERE retry_after IS NULL OR retry_after <= ADDTIME(UTC_TIMESTAMP(), '30')")
puts result.to_a.first['size']
