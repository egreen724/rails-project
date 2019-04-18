class Trip < ApplicationRecord
  belongs_to :user
  belongs_to :activity

  def to_hours
    if self.time_ellapsed
      if self.time_ellapsed > 60
       time = "#{self.time_ellapsed/60} hours"
      else
       time = "#{self.time_ellapsed} minutes"
      end
      time
    end
  end

end
