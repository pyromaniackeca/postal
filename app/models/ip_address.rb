# == Schema Information
#
# Table name: ip_addresses
#
#  id         :integer          not null, primary key
#  ip_pool_id :integer
#  ipv4       :string
#  ipv6       :string
#  created_at :datetime
#  updated_at :datetime
#  hostname   :string
#

class IPAddress < ApplicationRecord

  belongs_to :ip_pool

  validates :ipv4, :presence => true, :uniqueness => true
  validates :hostname, :presence => true
  validates :ipv6, :uniqueness => {:allow_blank => true}

end
