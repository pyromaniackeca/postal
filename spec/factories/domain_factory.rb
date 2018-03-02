# == Schema Information
#
# Table name: domains
#
#  id                     :integer          not null, primary key
#  server_id              :integer
#  uuid                   :string
#  name                   :string
#  verification_token     :string
#  verification_method    :string
#  verified_at            :datetime
#  dkim_private_key       :text
#  created_at             :datetime
#  updated_at             :datetime
#  dns_checked_at         :datetime
#  spf_status             :string
#  spf_error              :string
#  dkim_status            :string
#  dkim_error             :string
#  mx_status              :string
#  mx_error               :string
#  return_path_status     :string
#  return_path_error      :string
#  outgoing               :boolean          default(TRUE)
#  incoming               :boolean          default(TRUE)
#  owner_type             :string
#  owner_id               :integer
#  dkim_identifier_string :string
#  use_for_any            :boolean
#
# Indexes
#
#  index_domains_on_server_id  (server_id)
#  index_domains_on_uuid       (uuid)
#

FactoryGirl.define do

  factory :domain do
    association :owner, :factory => :user
    sequence(:name) { |n| "example#{n}.com" }
    verification_method 'DNS'
    verified_at Time.now
  end

  factory :organization_domain, :parent => :domain do
    association :owner, :factory => :organization
  end

end
