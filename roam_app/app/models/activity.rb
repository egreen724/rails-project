class Activity < ApplicationRecord
  has_many :users, through: :trips
  has_many :trips
  belongs_to :creator, class_name: :User, foreign_key: :creator_id
  has_many :keywords, through: :activity_keywords
  has_many :activity_keywords
  accepts_nested_attributes_for :categories

end
