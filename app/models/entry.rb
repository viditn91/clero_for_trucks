class Entry < ActiveRecord::Base
  belongs_to :from_city, class_name: "City" 
  belongs_to :to_city, class_name: "City"
  belongs_to :weight
  belongs_to :material
  belongs_to :truck_type
  belongs_to :truck

  validates :mobile, :number_of_trucks, :from_city_id, :to_city_id, :weight_id, :truck_type_id, :material_id, presence: true
  before_validation :check_equality_of_from_and_to_city
  before_validation :check_that_schedule_date_is_in_future
  before_save :check_if_allocated
  after_create :send_notification_to_fleet_managers

  private

    def check_equality_of_from_and_to_city
      if(from_city_id == to_city_id)
        return false
      end
    end

    def check_that_schedule_date_is_in_future
      if date.to_date < Date.today
        return false
      end
    end

    def send_notification_to_fleet_managers
      # Instantiate a Twilio client
      client = Twilio::REST::Client.new(TWILIO_CONFIG['sid'], TWILIO_CONFIG['token'])
      body = "New demand entry --> From: #{ from_city.name }, To: #{ to_city.name}, Material: #{ material.name }, TruckType: #{ truck_type.name }, Weight: #{ weight.name }, Contact: #{ mobile }"

      # Create and send an SMS message
      # client.account.messages.create(
      #   from: TWILIO_CONFIG['from'],
      #   to: '+919051833262',
      #   body: body
      # )

      # client.account.messages.create(
      #   from: TWILIO_CONFIG['from'],
      #   to: '+919718890073',
      #   body: body
      # )

      # client.account.messages.create(
      #   from: TWILIO_CONFIG['from'],
      #   to: '+919869156273',
      #   body: body
      # )
    end

    def check_if_allocated
      if self.truck_id != nil
        self.allocated_at = Time.now
      end
    end
end