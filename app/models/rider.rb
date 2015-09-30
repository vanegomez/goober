class Rider < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true, on: :create

  has_many :rides
  has_many :drivers, through: :rides

  def active_ride
    rides.where.not(status: 4)
  end
end
