class Bloop < ActiveRecord::Base
  validates :message, length: { minimum: 2, maximum: 140 }
  belongs_to :user, counter_cache: true
end
