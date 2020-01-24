class User < ApplicationRecord
  has_many :trips
  has_many :activities, through: :trips
  has_many :creations, class_name: :Activity, foreign_key: :creator_id
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :age, :numericality => { :greater_than_or_equal_to => 0}
  validates :password, presence: true, on: :create


  def self.from_omniauth(auth)
    # Creates a new user only if it doesn't exist
    where(email: auth.info.email).first_or_initialize do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
  end

  def sorted_by_date
    if self.trips != []
      with_dates = self.trips.reject {|trip| trip.date.nil?}
      with_dates.sort_by {|trip| trip.date}
    end
  end

end
