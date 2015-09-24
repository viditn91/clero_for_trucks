class Weight < ActiveRecord::Base
  validates :name, presence: true
end