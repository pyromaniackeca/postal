# == Schema Information
#
# Table name: track_domains
#
#  id                     :integer          not null, primary key
#  uuid                   :string
#  server_id              :integer
#  domain_id              :integer
#  name                   :string
#  dns_checked_at         :datetime
#  dns_status             :string
#  dns_error              :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  ssl_enabled            :boolean          default(TRUE)
#  track_clicks           :boolean          default(TRUE)
#  track_loads            :boolean          default(TRUE)
#  excluded_click_domains :text
#

FactoryGirl.define do

  factory :track_domain do
    name "click"
    dns_status 'OK'
    association :server

    after(:build) do |track_domain|
      track_domain.domain ||= create(:domain, :owner => track_domain.server)
    end
  end

end
