# == Schema Information
#
# Table name: organizations
#
#  id                :integer          not null, primary key
#  uuid              :string
#  name              :string
#  permalink         :string
#  time_zone         :string
#  created_at        :datetime
#  updated_at        :datetime
#  ip_pool_id        :integer
#  owner_id          :integer
#  deleted_at        :datetime
#  suspended_at      :datetime
#  suspension_reason :string
#
# Indexes
#
#  index_organizations_on_permalink  (permalink)
#  index_organizations_on_uuid       (uuid)
#

FactoryGirl.define do

  factory :organization do
    name "Acme Inc"
    sequence(:permalink) { |n| "org#{n}" }
    association :owner, :factory => :user
  end

end
