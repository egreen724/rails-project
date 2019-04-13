class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def mins_to_hours(minutes)
    if minutes > 60
      minutes/60
    else
      minutes
    end
  end

end
