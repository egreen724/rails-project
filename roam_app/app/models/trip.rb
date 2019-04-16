class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def to_hours(minutes)
    if minutes > 60
     time = "#{minutes/60} hours"
    else
     time = "#{minutes} minutes"
    end
    time
  end

end
