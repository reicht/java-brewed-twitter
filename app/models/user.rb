class User < ActiveRecord::Base
  validates :username, presence: true
  has_many :bloops, dependent: :destroy
  has_secure_password
end
