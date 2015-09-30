class Driver < ActiveRecord::Base
  has_secure_password
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true
  validates :password, presence: true, on: :create
  validates :car_make, presence: true
  validates :car_model, presence: true
  validates :car_capacity, presence: true

  has_many :rides
  has_many :riders, through: :rides
end
