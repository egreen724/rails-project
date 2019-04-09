class ActivityKeyword < ApplicationRecord
  belongs_to :activity
  belongs_to :keyword 
end
