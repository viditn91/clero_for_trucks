class Entry < ActiveRecord::Base
  validates :mobile, presence: true
  after_create :send_notification_to_user

  private
    def send_notification_to_user
    end
end
