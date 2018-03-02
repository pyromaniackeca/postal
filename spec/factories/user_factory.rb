# == Schema Information
#
# Table name: users
#
#  id                               :integer          not null, primary key
#  uuid                             :string
#  first_name                       :string
#  last_name                        :string
#  email_address                    :string
#  password_digest                  :string
#  time_zone                        :string
#  email_verification_token         :string
#  email_verified_at                :datetime
#  created_at                       :datetime
#  updated_at                       :datetime
#  password_reset_token             :string
#  password_reset_token_valid_until :datetime
#  admin                            :boolean          default(FALSE)
#
# Indexes
#
#  index_users_on_email_address  (email_address)
#  index_users_on_uuid           (uuid)
#

FactoryGirl.define do

  factory :user do
    first_name "John"
    last_name "Doe"
    password "passw0rd"
    email_verified_at Time.now
    sequence(:email_address) { |n| "user#{n}@example.com" }
  end

end
