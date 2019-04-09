class Keyword < ApplicationRecord
  has_many :activities, through: :activity_keywords
  has_many :activity_keywords 
end
