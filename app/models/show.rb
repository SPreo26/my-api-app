class Show < ActiveRecord::Base
  validates :datetime, presence: true
end
