class User < ApplicationRecord
  has_many :trips
  has_many :activities, through: :trips
  has_many :creations, class_name: :Activity, foreign_key: :creator_id
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true
  validates :age, :numericality => { :greater_than_or_equal_to => 0}
  validates :password, presence: true, on: :create 

end
