# == Schema Information
#
# Table name: broadcast_announcements
#
#  id              :bigint           not null, primary key
#  expiry          :date
#  link            :text
#  message         :text
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  organization_id :bigint           not null
#  user_id         :bigint           not null
#
class BroadcastAnnouncement < ApplicationRecord
  belongs_to :user
  belongs_to :organization
  validates :link, format: URI::DEFAULT_PARSER.make_regexp(%w[http https]), allow_blank: true
  validates :message, presence: true
end
