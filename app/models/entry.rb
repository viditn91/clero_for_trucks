class Entry < ActiveRecord::Base
  belongs_to :from_city, class_name: "City" 
  belongs_to :to_city, class_name: "City"
  belongs_to :weight
  belongs_to :material
  belongs_to :truck_type
  belongs_to :truck
   
  validates :mobile, :number_of_trucks, :from_city_id, :to_city_id, :weight_id, :truck_type_id, :material_id, presence: true
  after_create :send_notification_to_user
  before_save :check_if_allocated

  private
    def send_notification_to_user
    end

    def check_if_allocated
      if self.truck_id != nil
        self.allocated_at = Time.now
      end
    end
end